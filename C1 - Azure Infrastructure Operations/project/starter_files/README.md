# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions
****Run the following commands to start working with this project:****

- use `az login` command to login to your azure account form azure CLI
- create a resource group with **az group create**. Run this command on azure CLI `az group create -n <ResourceGroup Name> -l <Region>`
- create azure credentials from azure cli using `az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"` you will get an output having your **client_id, client_secret and tenant_id**
- run `az account show --query "{ subscription_id: id }"` command from azure CLI to obtain your Azure subscription ID

### Deploy your Infrastructure

- To build your Virtual machine image run `packer build -var-file=variables.json server.json`

### Deploy your Terraform Template

- Modify the `vars.tf` file to customize the default values according to your requirements

****Use the following Terraform commands to deploy the terraform template****

- Once you successfully deploy the VM image run `terraform plan -out solution.plan` to save the plan file as `solution.plan`
- run `terraform apply "solution.plan"` to deploy the changes to azure cloud

### Output
**You will get the following outputs for your infrasturcture and terraform template Deployment**

*Text Build Complete*
![Text Build Complete](Screenshots/packerbuild.txt)

*Soultion.plan files*
![Solution plan img file](Screenshots/solutionplan.JPG) 
![Solution plan img file](Screenshots/solutionplan1.JPG)

