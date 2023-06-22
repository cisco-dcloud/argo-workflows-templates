
#########################
#   ONPREM DCLOUD INFRA
#########################

provider "vsphere" {
  user                 = var.vsphere_username
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

#####################
#   CLOUD AWS INFRA
#####################

provider "aws" {
  alias = "default"
  region  = var.region
  default_tags {
    tags = {
      Environment = "dcloud-demos"
      Owner       = var.session_owner
      Session     = var.session_id
    }
  }

  dynamic "assume_role" {    
    for_each = var.is_local == true ? [] : [1]  
    content {      
        role_arn = "arn:aws:iam::${var.dce_child_account}:role/DCE_Admin_Access"
    }
  }

}

data "aws_caller_identity" "current" {} # used for accesing Account ID and ARN

