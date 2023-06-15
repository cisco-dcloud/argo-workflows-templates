variable "samlRoles" {
  type        = list(object({
    roleName     = string
    policyName   = string
  }))
  description = "List of roles and their policies"
  default = []
}