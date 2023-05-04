

output "random_value" {
  value = random_string.releasename.result
}

output "input_value" {
  value = var.input
}



