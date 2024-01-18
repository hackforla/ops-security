# policies/variables.tf

variable "policies" {
  description = "Map of policy definitions"
  type = map(object({
    description = string
    filename    = string
  }))
}
