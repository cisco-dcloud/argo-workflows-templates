
####################
# GENERAL INPUTS 
####################
variable "dce_child_account" {
  type        = string
  description = "DCE Child Account "
  default = "0"
}
variable "is_local" {
  type        = bool
  description = "Running local?"
  default = false
}
variable "session_id" {
  type        = string
  description = "Demo Session ID"
}
variable "session_owner" {
  type        = string
  description = "Demo Session Owner"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}


####################
# SPECIFIC INPUTS 
####################

variable "iamUsers" {
  type           = list(object({
    userName     = string
    policyName   = string
  }))
  default = []
  description = "List of IAM users to create and the name of the policy to be attached to each"
}

variable "policies" {
  type        = list(object({
    policy       = string
    policyName   = string
  }))
  description = "List of policies to create. The policy value is the name of the json file that defines the policy."
  default = []
}

variable "samlRoles" {
  type           = list(object({
    roleName     = string
    policyName   = string
  }))
  default = []
  description = "List of saml enabled roles to create"
}
