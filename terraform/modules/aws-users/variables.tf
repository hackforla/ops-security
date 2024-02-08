# users/variables.tf

variable "user_name" {
  description = "The name of the IAM user"
  type        = string
}

variable "user_path" {
  description = "Path in which to create the user"
  type        = string
  default     = "/"
}

variable "user_tags" {
  description = "Tags to assign to the user"
  type        = map(string)
  default     = {}
}

variable "user_groups" {
  description = "List of IAM groups the user should be a member of"
  type        = list(string)
  default     = []
}
