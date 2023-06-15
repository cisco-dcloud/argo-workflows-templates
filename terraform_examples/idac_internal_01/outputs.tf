##########################
# OUTPUTS
##########################

output "all_users"{
  value = module.iam-users.all_users
  sensitive = true
}

output "all_saml_roles"{
  value = module.iam-saml.all_saml_roles
}
