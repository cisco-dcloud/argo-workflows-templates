vsphere_datacentre = "vpod"
domain_name        = "idev.ciscodcloud.com"
dns_search         = ["idev.ciscodcloud.com"]
folder_name        = "argo"
vm = {
  example_vm_0 = {
    vmname    = "argo-example-server-0",
    vmgateway = "198.18.128.1"
    network = {
      "Services Network" = ["198.18.128.200"],
    }
  }
  example_vm_1 = {
    vmname    = "argo-example-server-1",
    vmgateway = "198.18.128.1"
    network = {
      "Services Network" = ["198.18.128.201"],
    }
  }
  example_vm_2 = {
    vmname    = "argo-example-server-2",
    vmgateway = "198.18.128.1"
    network = {
      "Services Network" = ["198.18.128.202"],
    }
  }
}


