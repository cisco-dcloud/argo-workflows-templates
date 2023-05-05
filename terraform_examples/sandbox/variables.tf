variable "aws_region" {
  type        = string
  description = "AWS Region."
  default     = "eu-west-2"
}


###########
#  EKS
###########

variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
  default     = "workflows-sandbox"
}


##################
#  ROUTE53 SUFFIX 
##################  
variable "sub_domain" {
  type        = string
  description = "Suffix added to the Route53 records created on this EKS cluster"
  default = "workflows"
}

variable "domain" {
  type        = string
  description = "Suffix added to the Route53 records created on this EKS cluster"
  default     = "cat-dcloud.com"
}

locals {
  internal_domain = "${var.sub_domain}.${var.domain}"
}


##############
#  NAMESPACES 
##############
variable "sandbox_ns" {
  type        = string
  description = "Namespace to use by Argo Workflows"
  default     = "argo"
}
