

output "cloud_vms_ips" {
  value = tomap({
    for k, i in module.vm_creation : k => i.private_ip
  })
}

output "cloud_vms_arn" {
  value = tomap({
    for k, i in module.vm_creation : k => i.arn
  })
}