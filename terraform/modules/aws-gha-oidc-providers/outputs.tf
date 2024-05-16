output "role_arn" {
  value       = aws_iam_role.github_actions_oidc.arn
  description = "The ARN of the IAM role for the federated identity"
}

output "provider_arn" {
  value       = aws_iam_openid_connect_provider.github_actions.arn
  description = "The ARN of the OIDC provider"
}
