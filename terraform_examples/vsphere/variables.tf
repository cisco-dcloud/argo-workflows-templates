##Common Variables##
variable "datastore_name" {
  description = "Provide the datastore name"
  type        = map
  default = {
    idev = "idev_nfs_plat_hx"
    lon  = "lon_nfs_plat_hx"
    rtp  = "rtp_nfs_plat_hx"
    sng  = "sng_nfs_plat_hx"
    sjc  = "sjc_nfs_plat_hx"
    syd  = "syd_nfs_plat_hx"
  }
}

variable "dc_name" {
  description = "Datacenter name"
  type        = map
  default = {
    idev = "IDEV-Platform-DC"
    lon  = "LON-Platform-DC"
    rtp  = "RTP-Platform-DC"
    sng  = "SNG-Platform-DC"
    sjc  = "SJC-Platform-DC"
    syd  = "SYD-Platform-DC"
  }
}

variable "dns_list" {
  description = "dns server list"
  type        = list
  default     = ["10.1.25.101", "10.1.25.102"]
}

variable "dns_search" {
  description = "dns search name"
  type        = list
  default     = ["dcloud-cisco.com"]
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "ciscodcloud.com"
}

variable "folder_name" {
  description = "Location of the VMs in vSphere (Folder needs to be created first)"
  default     = "" # Projects/$your_project_name
  type        = string
}

variable "pool_name" {
  description = "Resource pool name"
  type        = map
  default = {
    idev = "idev-ucs-plat-hx/Resources"
    lon  = "lon-ucs-plat-hx/Resources"
    rtp  = "rtp-ucs-plat-hx/Resources"
    sng  = "sng-ucs-plat-hx/Resources"
    sjc  = "sjc-ucs-plat-hx/Resources"
    syd  = "syd-ucs-plat-hx/Resources"
  }
}

variable "vm" {
  type = map(object({
    network   = map(list(string))
    vmname    = string
    vmgateway = string
  }))
}

variable "vm_cpu" {
  description = "Number of CPUs"
  type        = string
  default     = "2"
}

variable "vm_ram" {
  description = "VM RAM size in megabytes."
  type        = string
  default     = "5120"
}

variable "vm_template" {
  description = "Provide the datastore name"
  type        = map
  default = {
    idev = "centos7_common-28-10-2021"
    lon  = "centos7_common-28-10-2021"
    rtp  = "centos7_common-28-10-2021"
    sng  = "centos7_common-28-10-2021"
    sjc  = "centos7_common-28-10-2021"
    syd  = "centos7_common-29-11-2021"
  }
}

variable "vsphere_datacentre" {
  description = "vSphere datacentre (e.g. idev, rtp, lon, sjc, sng)"
  type        = string
  default     = "null"
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  default     = ""
}

variable "vsphere_servers" {
  type = map
  default = {
    idev = "192.133.202.26:443"
    lon  = "64.103.46.16:443"
    rtp  = "64.100.12.52:443"
    sng  = "173.39.116.32:443"
    sjc  = "128.107.93.161:443"
    syd  = "64.104.251.16:443"
  }
}

variable "vsphere_server" {
  type = string
}

variable "vsphere_username" {
  description = "vSphere username"
  type        = string
  default     = ""
}
