# users/outputs.tf

output "user_name" {
  value = aws_iam_user.user.name
  description = "The name of the IAM user"
}

output "user_arn" {
  value = aws_iam_user.user.arn
  description = "The ARN of the IAM user"
}
