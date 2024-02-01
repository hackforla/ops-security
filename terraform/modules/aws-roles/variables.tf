# roles/variables.tf

variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_principal" {
  description = "The AWS service or entity that can assume this role"
  type        = string
}

variable "policy_arn" {
  description = "The ARN of the policy to attach to the role"
  type        = string
}
