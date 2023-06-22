
output "onprem_vms" {
  value = tomap({
    for k, i in module.dcloud_onprem_vsphere : k => i.VM
  })
}

output "openpre_ips" {
  description = "default ip address of the deployed VM"
  value = tomap({
    for k, i in module.dcloud_onprem_vsphere : k => i.ip
  })
}


# output vm {
#   description = "VM"
#   value = vsphere_virtual_machine.vm
#   sensitive = true
# }

