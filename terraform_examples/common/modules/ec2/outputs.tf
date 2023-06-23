

output "cloud_vms_ips" {
  value = tomap({
    for k, i in aws_instance.ec2 : k => i.private_ip
  })
}

output "cloud_vms_arn" {
  value = tomap({
    for k, i in aws_instance.ec2 : k => i.arn
  })
}