provider "vsphere" {
  version              = "~> 1.10"
  user                 = var.vsphere_username
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_servers[var.vsphere_datacentre]
  allow_unverified_ssl = true
}
