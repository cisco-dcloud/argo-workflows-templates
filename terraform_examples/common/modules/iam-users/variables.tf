variable "iamUsers" {
  type        = list(object({
    userName     = string
    policyName   = string
  }))
  description = "List of users and their policies"
  default = []
}

variable "validPolicies"{
   type        = list(string)
  description = "List of valid policy names"
  default = [] 
}