# groups/outputs.tf

output "group_name" {
  value = aws_iam_group.group.name
  description = "The name of the IAM group"
}

output "group_arn" {
  value = aws_iam_group.group.arn
  description = "The ARN of the IAM group"
}
