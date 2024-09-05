locals {
  oidc_aws_audience = "sts.amazonaws.com"
  oidc_github_idp   = "token.actions.githubusercontent.com"

  # compose the OIDC subject using opinionated set of claims
  # TODO: discuss alternative with maintainers
  #   see 'claims_supported' for all possibilities (some of which would require custom GHA):
  #      https://token.actions.githubusercontent.com/.well-known/openid-configuration
  ordered_claim_names = [
    "repo", "environment", "ref"
  ]

  # map user-supplied args to claim names, some of which may be empty
  claims_with_values = zipmap(local.ordered_claim_names, [
    var.github_repo, var.github_environment, var.github_branch
  ])

  # construct 'sub' claim parts by selecting non-empty arg values, then combine
  claims = [
    for claim in local.ordered_claim_names : format(
      "%s:%s",
      claim,
      local.claims_with_values[claim]
    ) if length(local.claims_with_values[claim]) > 0
  ]

  oidc_gha_sub = join(":", var.allow_pull_request ? concat(
    local.claims, ["pull_request"]
    ) : local.claims
  )

  /*
    Alternative, which would place more responsibility on user to specify valid OIDC claims:
     
      `oidc_expected_claims = join(":", [for k,v in var.claim_patterns : "${k}:${v}"])`
  */

}

data "aws_caller_identity" "current" {}

data "tls_certificate" "github_actions" {
  url = "https://${local.oidc_github_idp}"
}

resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://${local.oidc_github_idp}"

  client_id_list = [
    local.oidc_aws_audience
  ]

  thumbprint_list = [data.tls_certificate.github_actions.certificates[0].sha1_fingerprint]
}

resource "aws_iam_role" "github_actions_oidc" {

  name                = var.role_name
  managed_policy_arns = var.policy_arns

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_github_idp}"
      },
      "Action" : "sts:AssumeRoleWithWebIdentity",
      "Condition" : var.use_wildcard ? {
        "StringLike" : {
          "token.actions.githubusercontent.com:sub" : local.oidc_gha_sub
        },
        "StringEquals" : {
          "token.actions.githubusercontent.com:aud" : local.oidc_aws_audience,
        }
        } : {
        "StringEquals" : {
          "token.actions.githubusercontent.com:aud" : local.oidc_aws_audience,
          "token.actions.githubusercontent.com:sub" : local.oidc_gha_sub
        }
      }
    }]
  })
}