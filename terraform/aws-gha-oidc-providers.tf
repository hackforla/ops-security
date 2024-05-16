module "iam_oidc_gha_incubator" {
  source             = "./modules/aws-gha-oidc-providers"

  role_name          = "gha-incubator"
  use_wildcard       = true
  allow_pull_request = true
  github_branch      = "refs/heads/*" # allows any branch
  github_repo        = "hackforla/incubator"

  policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess"
  ]
}
