module "vm_creation" {
  for_each        = var.vm
  source          = "Terraform-VMWare-Modules/vm/vsphere"
  version         = "3.1.0"
  cpu_number      = var.vm_cpu
  dc              = var.dc_name[var.vsphere_datacentre]
  disk_datastore  = var.datastore_name[var.vsphere_datacentre]
  dns_server_list = var.dns_list
  dns_suffix_list = var.dns_search
  domain          = var.domain_name
  network         = each.value.network
  ram_size        = var.vm_ram
  staticvmname    = "${var.vsphere_datacentre}-${each.value.vmname}"
  vmfolder        = var.folder_name
  vmgateway       = each.value.vmgateway
  vmrp            = var.pool_name[var.vsphere_datacentre]
  vmtemp          = var.vm_template[var.vsphere_datacentre]
}
