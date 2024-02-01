# module "aws_iam_policies" {
#   source   = "./modules/policies"
#   policies = {
#     "ManageAccessKeys" = {
#       description = "Policy for creating, listing, and updating Access Keys"
#       filename    = "manage-access-keys-policy.json"
#     },
#     "FullAccessPolicy" = {
#       description = "Full access to specific resources"
#       filename    = "full-access-policy.json"
#     }
#   }
# }
