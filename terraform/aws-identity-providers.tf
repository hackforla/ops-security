# references: 
#   https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect
#   https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html#idp_oidc_Create_GitHub
#   https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider
#   https://github.com/aws-actions/configure-aws-credentials#configure-aws-credentials-for-github-actions

locals {
  # prefix used in custom resource names
  naming_prefix = "github-incubator-actions-terraform"

  # AWS receives the call from Actions, so is registered as the 'aud' of the id token
  oidc_aws_audience = "sts.amazonaws.com"

  # well-known identity provider FQDN
  oidc_github_idp = "token.actions.githubusercontent.com"

  # repository which will be authorized to assume IAM role
  github_repo_name = "incubator"

  # branch which will be authorized to assume IAM role
  github_branch_name = "main"

  # aws actions creds provider will use this schema for the 'sub' of the id token
  oidc_github_subject = "repo:hackforla/${local.github_repo_name}:ref:refs/heads/${local.github_branch_name}"
}

data "aws_caller_identity" "current" {}

resource "aws_iam_openid_connect_provider" "github_actions" {
  url = "https://${local.oidc_github_idp}"

  client_id_list = [
    local.oidc_aws_audience
  ]

  thumbprint_list = ["1b511abead59c6ce207077c0bf0e0043b1382612"]
}

resource "aws_iam_role" "github_actions_oidc" {
  name = "${local.naming_prefix}-deployer"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${local.oidc_github_idp}"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "token.actions.githubusercontent.com:aud" : local.oidc_aws_audience,
            "token.actions.githubusercontent.com:sub" : local.oidc_github_subject
          }
        }
        /** TODO: discuss, update and remove this comment -- there are multiple approaches devops/incubator can
          *    can use to authorize tokens, including branches/environments with wildcard patterns support e.g. release/*
          * wildcard example:

                "Condition" : {
                    "StringLike": {
                        "token.actions.githubusercontent.com:sub": "repo:octo-org/octo-repo:*"
                    },
                    "StringEquals": {
                        "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                    }
                }
                
        */
      }
    ]
  })

  tags = {
    "app" = "devops-security"
  }

}
