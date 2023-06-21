#########################
#   ONPREM DCLOUD INFRA
#########################

variable "vsphere_datacentre" {
  description = "vSphere datacentre (e.g. idev, rtp, lon, sjc, sng)"
  type        = string
  default     = "idev"
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  default     = ""
}

variable "vsphere_server" {
  type = string
}

variable "vsphere_username" {
  description = "vSphere username"
  type        = string
  default     = ""
}

#####################
#   CLOUD AWS INFRA
#####################
variable "dce_child_account" {
  type        = string
  description = "DCE Child Account "
  default = "0"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}

#####################
#   GENERIC INPUTS
#####################

variable "is_local" {
  type        = bool
  description = "Running local?"
  default = false
}
variable "session_id" {
  type        = string
  description = "Demo Session ID"
}
variable "session_owner" {
  type        = string
  description = "Demo Session Owner"
}
