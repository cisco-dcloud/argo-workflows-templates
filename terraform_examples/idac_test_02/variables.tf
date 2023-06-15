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

variable "instances" {
  type = list(object({
    name  = string,
    type  = string
  }))
  description = "List of instances" 
  default     = []
}


