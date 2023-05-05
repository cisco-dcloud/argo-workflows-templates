

output "random" {
  value = random_string.releasename.result
  sensitive = true
}

output "fqdn" {
  value = aws_route53_record.webconsole.name
  sensitive = true
}



