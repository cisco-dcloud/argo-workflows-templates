
## Create IAM Policies 
module "iam-policies" {
  source                     = "./common/modules/iam-policies/"
  policies                   = var.policies
}

## Create IAM Users 
module "iam-users" {
  source                     = "./common/modules/iam-users/"
  iamUsers                   = var.iamUsers
  depends_on = [
    module.iam-policies
  ]
}

## Create SAML ROLES 
module "iam-saml" {
  source                     = "./common/modules/iam-saml/"
  samlRoles                   = var.samlRoles
  depends_on = [
    module.iam-policies
  ]
}