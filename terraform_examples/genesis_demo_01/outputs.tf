
output "onprem_vms" {

  value = module.dcloud_onprem_vsphere.VM

}

output "onprem_ips" {

  value = module.dcloud_onprem_vsphere.ip

}

output "cloud_vms_ips" {

  value = module.dcloud_cloud_aws_ec2.cloud_vms_ips

}

output "cloud_vms_arn" {

  value = module.dcloud_cloud_aws_ec2.cloud_vms_arn

}




