variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "github_repo" {
  description = "The repository name (or name wildcard pattern if use_wildcard=true)"
  type        = string

  validation {
    condition     = can(regex("hackforla/.*", var.github_repo))
    error_message = "The github_repo argument must begin with 'hackforla/'"
  }
}

variable "github_branch" {
  description = "The branch name (or name wildcard pattern if use_wildcard=true)"
  type        = string

  validation {
    condition     = can(regex("refs/(heads|tags)/.*", var.github_branch))
    error_message = "The github_branch argument must begin with 'refs/heads/' or 'refs/tags/"
  }
}

variable "github_environment" {
  description = "The environment name (optional)"
  type        = string
  default     = ""
}

variable "policy_arns" {
  description = "The ARN of the policy to attach to the role"
  type        = list(string)
}

variable "use_wildcard" {
  description = "Specifies whether OIDC claim subject should use wildcard pattern"
  type        = bool
}

variable "allow_pull_request" {
  description = "Authorize the token for pull requests"
  type        = bool
  default     = false
}

/*
    Alternative, which would place more responsibility on user to specify valid OIDC claims:

      `variable "claim_patterns" {
        description = "Specifies arbitrary "
        type = map(string)
      }`
  */

