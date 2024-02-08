// Create read only group
module "iam_read_only_group" {
  source = "./modules/aws-groups"

  group_name = "read-only-group"
  policy_arn = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}
