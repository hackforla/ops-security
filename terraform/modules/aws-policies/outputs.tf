# policies/outputs.tf

output "policy_arns" {
  value = { for k, v in aws_iam_policy.custom_policy : k => v.arn }
  description = "Map of policy names to their ARNs"
}
