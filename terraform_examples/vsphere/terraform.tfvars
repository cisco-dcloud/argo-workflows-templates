vsphere_datacentre = "idev"
domain_name        = "idev.ciscodcloud.com"
dns_search         = ["idev.ciscodcloud.com"]
folder_name        = "argo"
vm = {
  example_vm = {
    vmname    = "argo-example-server",
    vmgateway = "198.18.128.1"
    network = {
      "pp-vlan1970" = ["10.1.23.185"],
    }
  }
}

datastore_name = {
    idev    = "nfs_delta_238"
  }

dc_name = {
    idev = "vPods"
  }

pool_name = {
    idev = "vPod_Cluster_A"
  }

vm_template = {
    idev = "argotestvm"
  }


