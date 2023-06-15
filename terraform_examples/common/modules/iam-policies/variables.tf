variable "policies" {
  type        = list(object({
    policy       = string
    policyName   = string
  }))
  description = "List of policies"
  default = []
}


########
#GITHUB
########
# variable "policy_github_branch" {
#   type        = string
#   description = "Github branch "
#   default = "main"
# }
