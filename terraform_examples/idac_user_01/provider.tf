provider "aws" {
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
