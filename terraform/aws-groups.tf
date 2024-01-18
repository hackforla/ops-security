// Create groups and attach policies
module "iam_read_only_group" {
  source = "./modules/groups"

  group_name = "read-only-group"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

module "iam_project_admin_group" {
  source = "./modules/groups"

  group_name = "project-admin-group"
  policy_arn = [ # here we can pass a list of policies that are aws managed or customer managed
    "arn:aws:iam::aws:policy/SomeAWSPolicy",
    module.iam_policies.policy_arns["ManageAccessKeys"]
  ]
}

module "iam_ops_mentor_group" {
  source = "./modules/groups"

  group_name = "project-admin-group"
  policy_arn = [ # here we can pass a list of policies that are aws managed or customer managed
    "arn:aws:iam::aws:policy/SomeAWSPolicy",
    "arn:aws:iam::aws:policy/SomeAWSPolicy",
    "arn:aws:iam::aws:policy/SomeAWSPolicy",
    "arn:aws:iam::aws:policy/SomeAWSPolicy",
  ]
}

// Assign users to groups
resource "aws_iam_group_membership" "project_admin_group_membership" {
  name = "project_admin_group_membership"  # A unique name for the group membership

  users = [
    module.iam_user_gwenstacy.user_name,
    module.iam_user_miles_morales.user_name,
    "chelseybeck"
  ]

  group = module.iam_project_admin_group.group_name
}
