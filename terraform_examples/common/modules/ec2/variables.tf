variable "vpc" {
  type = any
}

variable "instances" {
  type = list(object({
    name  = string,
    type  = string
  }))
  description = "List of instances" 
  default     = []
}

