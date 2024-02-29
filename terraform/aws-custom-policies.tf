module "aws_custom_policies" {
  source = "./modules/aws-policies"
  policies = {
    "IAMServicesSupervisor" = {
      description = "Policy granting IAM services admins permissions to make changes to user accounts"
      filename    = "level-4-iam-services-supervisor-policy.json"
    }
  }
}
