vsphere_datacentre = "vpod"
domain_name        = "idev.ciscodcloud.com"
dns_search         = ["idev.ciscodcloud.com"]
folder_name        = "argo"
vm = {
  example_vm = {
    vmname    = "argo-example-server",
    vmgateway = "198.18.128.1"
    network = {
      "Services Network" = ["10.1.23.185"],
    }
  }
}

datastore_name = {
    vpod    = "NFS"
  }

dc_name = {
    vpod = "dCloud-DC"
  }

pool_name = {
    vpod = "dCloud-Cluster/Resources"
  }

vm_template = {
    vpod = "Centos7"
  }


