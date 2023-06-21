#Argo Workflow POC: Use Terraform vSphere Module to clone a VM in iDEV (onprem) 

This folder will be pulled from Github by an Argo Workflow that will in turn create a plan and apply/destroy it accordingly. 

For the purposes of the POC, all the values are provided in the`terraform.tfvars` file. 

The state files are stored locally and passed through the different tasks (plan, apply, destroy) as artifacts. 


#Terraform vSphere Module

We use [following module](https://github.com/Terraform-VMWare-Modules/terraform-vsphere-vm) for Vshpere Virtual Machine Provisioning with (Linux) customization based on Terraform v0.13 and up.
