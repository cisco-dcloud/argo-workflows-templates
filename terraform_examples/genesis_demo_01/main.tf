
#########################
#   ONPREM DCLOUD INFRA
#########################

module "dcloud_onprem_vsphere" {
  source                      = "./common/modules/dcloud-onprem-vsphere"
  vsphere_datacentre = var.vsphere_datacentre
  domain_name        = "idev.ciscodcloud.com"
  dns_search         = ["idev.ciscodcloud.com"]
  folder_name        = var.vsphere_foldername
  vsphere_password   = var.vsphere_password
  vsphere_server     = var.vsphere_server
  vsphere_username   = var.vsphere_username
  vm                 = {
                    example_vm_0 = {
                      vmname    = "argo-example-server-0",
                      vmgateway = "198.18.128.1"
                      network = {
                        "pp-vlan1970" = ["198.18.128.200"],
                      }
                    }
                    example_vm_1 = {
                      vmname    = "argo-example-server-1",
                      vmgateway = "198.18.128.1"
                      network = {
                        "pp-vlan1970" = ["198.18.128.201"],
                      }
                    }
                    example_vm_2 = {
                      vmname    = "argo-example-server-2",
                      vmgateway = "198.18.128.1"
                      network = {
                        "pp-vlan1970" = ["198.18.128.202"],
                      }
                    }
                    example_vm_3 = {
                      vmname    = "argo-example-server-3",
                      vmgateway = "198.18.128.1"
                      network = {
                        "pp-vlan1970" = ["198.18.128.203"],
                      }
                    }
                    example_vm_4 = {
                      vmname    = "argo-example-server-4",
                      vmgateway = "198.18.128.1"
                      network = {
                        "pp-vlan1970" = ["198.18.128.204"],
                      }
                    }
                    example_vm_5 = {
                      vmname    = "argo-example-server-5",
                      vmgateway = "198.18.128.1"
                      network = {
                        "pp-vlan1970" = ["198.18.128.205"],
                      }
                    }
                  }
}

#####################
#   CLOUD AWS INFRA
#####################

module "dcloud_cloud_aws_vpc" {
  source                     = "./common/modules/vpc"
  vpc_name                   = "${var.session_owner}-${var.session_id}"
}

module "dcloud_cloud_aws_ec2" {
  source                     = "./common/modules/ec2"
  vpc                        = module.dcloud_cloud_aws_vpc.vpc
  instances                  = [
                                {
                                  name = "genesis-demo-ec2-01", 
                                  type = "t1.micro"
                                },
                                {
                                  name = "genesis-demo-ec2-02", 
                                  type = "t1.micro"
                                }
                                ]

  depends_on = [
    module.dcloud_cloud_aws_vpc
  ]
}
