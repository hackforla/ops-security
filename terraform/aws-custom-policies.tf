module "aws_custom_policies" {
  source = "./modules/aws-policies"
  policies = {
    "IAMServicesAdmin" = {
      description = "Policy granting IAM services admins permissions to make changes to user accounts"
      filename    = "level-4-iam-services-admin-policy.json"
    }
  }
}
