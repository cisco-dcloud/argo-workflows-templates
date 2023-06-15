
## Create VPC
module "vpc" {
  source                     = "./common/modules/vpc"
  vpc_name                   = "${var.session_owner}-${var.session_id}"
}

## Create EC2 instances
module "ec2" {
  source                     = "./common/modules/ec2"
  instances                  = var.instances
  vpc                        = module.vpc.vpc
  depends_on = [
    module.vpc
  ]
}
