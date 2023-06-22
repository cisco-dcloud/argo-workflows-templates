
output "onprem_vms" {

  value = module.dcloud_onprem_vsphere.VM

}

output "onprem_ips" {

  value = module.dcloud_onprem_vsphere.ip

}

# output vm {
#   description = "VM"
#   value = vsphere_virtual_machine.vm
#   sensitive = true
# }

