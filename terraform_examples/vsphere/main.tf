# module "vm_creation" {
#   for_each                    = var.vm
#   source                      = "Terraform-VMWare-Modules/vm/vsphere"
#   version                     = "3.5.0"
#   cpu_number                  = var.vm_cpu
#   dc                          = var.dc_name[var.vsphere_datacentre]
#   disk_datastore              = var.datastore_name[var.vsphere_datacentre]
#   dns_server_list             = var.dns_list
#   dns_suffix_list             = var.dns_search
#   domain                      = var.domain_name
#   network                     = each.value.network
#   ram_size                    = var.vm_ram
#   staticvmname                = "${var.vsphere_datacentre}-${each.value.vmname}"
#   vmfolder                    = var.folder_name
#   vmgateway                   = each.value.vmgateway
#   vmrp                        = var.pool_name[var.vsphere_datacentre]
#   vmtemp                      = var.vm_template[var.vsphere_datacentre]
#   firmware                    = "bios" #efi or bios
#   # efi_secure_boot             = true
#   wait_for_guest_net_routable = false

# }


data "vsphere_datacenter" "datacenter" {
  name = var.dc_name[var.vsphere_datacentre]
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name[var.vsphere_datacentre]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name[var.vsphere_datacentre]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.network_name[var.vsphere_datacentre]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template[var.vsphere_datacentre]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "argo-vsphere-hello-world"
  folder           = "argo"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = 1
  memory           = 1024
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "hello-world"
        # domain    = "example.com"
      }
      network_interface {
        ipv4_address = "10.1.23.185"
        ipv4_netmask = 24
      }
      ipv4_gateway = "198.18.128.1"
    }
  }
}