#Terraform vSphere Module

We use [following module](https://github.com/Terraform-VMWare-Modules/terraform-vsphere-vm) for Vshpere Virtual Machine Provisioning with (Linux) customization based on Terraform v0.13 and up.

As suggested in the module, we have created `main.tf`,`provider.tf`,`variables.tf`,`backend.tf` and `output.tf`. Also, `.ini` files contains datacenter based resources. The child folders created based on the project and environment requirement.


How to use this

```
gh repo clone wwwin-github.cisco.com/pov-services/tf_vsphere_vm_build_v2
cd tf_vsphere_vm_build_v2/
mkdir example
```
create the softlinks for the necessary files(ex: main.tf,outputs.tf,provider.tf,idev_dc.ini,variables.tf) under than folder and create the tfvars for that project.

```
ln -s ../main.tf .
ln -s ../provider.tf .
ln -s ../variables.tf .
ln -s ../output.tf .
```
create tht tfvars for the project environment and backend.tf.
Eg:
backend.tf

```
terraform {
  backend "s3" {
    encrypt        = "true"
    key            = "example.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform_locking"
  }
}
```
example.tfvars

```
vsphere_datacentre = "idev"
domain_name        = "idev.ciscodcloud.com"
dns_search         = ["idev.ciscodcloud.com"]
folder_name        = "Projects/example"
vm = {
  example_vm = {
    vmname    = "example-server",
    vmgateway = "10.1.23.1"
    network = {
      "hx-vlan23" = ["10.1.23.185"],
    }
  }
```
Execute `terraform init` and create the workspace for that environment

```
terraform init
terraform workspace new example
terraform plan -var-file example.tfvars -out=example.out
terraform apply example.out
```

