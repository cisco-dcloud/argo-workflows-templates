vsphere_datacentre = "idev"
domain_name        = "idev.ciscodcloud.com"
dns_search         = ["idev.ciscodcloud.com"]
folder_name        = "Projects/example"
vm = {
  example_vm = {
    vmname    = "argo-example-server",
    vmgateway = "10.1.23.1"
    network = {
      "hx-vlan23" = ["10.1.23.185"],
    }
  }
}