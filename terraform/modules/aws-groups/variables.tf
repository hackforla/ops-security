# groups/variables.tf

variable "group_name" {
  description = "The name of the IAM group"
  type        = string
}

variable "group_path" {
  description = "Path in which to create the group"
  type        = string
  default     = "/"
}

variable "policy_arn" {
  description = "The ARN of the policy to attach to the group"
  type        = string
}

variable "policy_arns" {
  description = "List of policy ARNs to attach to the group"
  type        = list(string)
}
