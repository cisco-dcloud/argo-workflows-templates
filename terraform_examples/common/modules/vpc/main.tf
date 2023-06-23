
data "aws_availability_zones" "available" {
  state = "available"
}

# create VPC  
module "vpc" {
  source                           = "terraform-aws-modules/vpc/aws"
  version                          = "4.0.2"
  name                             = "${var.vpc_name}"
  cidr                             = "10.0.0.0/16"
  azs                              = [data.aws_availability_zones.available.names[0]] #Use second AZ
  private_subnets                  = ["10.0.11.0/24"]
  public_subnets                   = ["10.0.0.0/24"]
  intra_subnets                    = ["10.0.21.0/24"]
  enable_nat_gateway               = true
  single_nat_gateway               = true
}


