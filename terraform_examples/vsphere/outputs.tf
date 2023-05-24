
output "VM" {
  value = tomap({
    for k, i in module.vm_creation : k => i.VM
  })
}

output "ip" {
  description = "default ip address of the deployed VM"
  value = tomap({
    for k, i in module.vm_creation : k => i.ip
  })
}


# output vm {
#   description = "VM"
#   value = vsphere_virtual_machine.vm
#   sensitive = true
# }

