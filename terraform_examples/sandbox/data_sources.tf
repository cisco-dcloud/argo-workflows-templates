#######################################################
#  AWS ACCOUNT 
#######################################################
data "aws_caller_identity" "current" {} # used for accesing Account ID and ARN

data "aws_region" "current" {}

#######################################################
#  EKS CLUSTER 
#######################################################

data "aws_eks_cluster_auth" "cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}

#######################################################
#  AWS ALB 
#######################################################

data "aws_lb" "main" {
  tags = {
    "elbv2.k8s.aws/cluster" = var.cluster_name
  }
}

#######################################################
#  ROUTE53 
#######################################################

data "aws_route53_zone" "sub_domain" {
  name         = local.internal_domain
  private_zone = false
}
