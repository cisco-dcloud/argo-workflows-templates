vsphere_datacentre = "idev"
domain_name        = "idev.ciscodcloud.com"
dns_search         = ["idev.ciscodcloud.com"]
folder_name        = "argo"
vm = {
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

datastore_name = {
    idev    = "nfs_delta_238"
  }

dc_name = {
    idev = "vPods"
  }

pool_name = {
    idev = "vPod_Cluster_A/Resources"
  }

vm_template = {
    idev = "argotestvm"
  }

cluster_name = {
    idev = "vPod_Cluster_A"
  }

network_name = {
    idev = "pp-vlan1970"
  }