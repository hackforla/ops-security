// Create read only group
module "iam_read_only_group" {
  source = "./modules/aws-groups"

  group_name = "read-only-group"
  policy_arn = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
}

// Create project admin group - this group is dependent on tagging resources
# module "iam_project_admin_group" {
#   source = "./modules/groups"

#   group_name = "project-admin-group"
#   policy_arn = [ # here we can pass a list of policies that are aws managed or customer managed
#     "arn:aws:iam::aws:policy/SomeAWSPolicy",
#     module.iam_policies.policy_arns["ManageAccessKeys"]
#   ]
# }

// Create mentor group - need to discuss these permissions
# module "iam_ops_mentor_group" {
#   source = "./modules/groups"

#   group_name = "ops-mentor-group"
#   policy_arn = [ # here we can pass a list of policies that are aws managed or customer managed
#     "arn:aws:iam::aws:policy/AdministratorAccess",
#     "arn:aws:iam::035866691871:policy/ManageAccessKeys",
#   ]
# }

// Create IAM management group -- 
# module "iam_services_supervisor_group" {
#   source = "./modules/groups"

#   group_name = "iam-services-supervisor-group"
#   policy_arn = [ # here we can pass a list of policies that are aws managed or customer managed
#     "arn:aws:iam::aws:policy/AdministratorAccess",
#     "arn:aws:iam::035866691871:policy/ManageAccessKeys",
#   ]
# }

// Cost management group = "Cost-Management"