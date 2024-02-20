// Create read only group
module "iam_read_only_group" {
  source = "./modules/aws-groups"

  group_name = "read-only-group"
  policy_arn = {
    "ReadOnlyAccess"        = "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "IAMUserChangePassword" = "arn:aws:iam::aws:policy/IAMUserChangePassword"
  }
}

// Create iam services admin group
module "iam_services_admin_group" {
  source = "./modules/aws-groups"

  group_name = "iam-services-admin-group"
  policy_arn = {
    "IAMServicesAdmin" = module.aws_custom_policies.policy_arns["IAMServicesAdmin"]
  }
}

