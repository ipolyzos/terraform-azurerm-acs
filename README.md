# Terraform AzureRM ACS

 Azure Container Service (ACS), provides a unique approach to managing containers in the cloud by offering a simple way to scale containers in production through proven open source container orchestration technology. 
 
 This project is a Terraform module to deploy ACS orchestration technologies while provisioning the minimal infrustrure required for them in a controled way.
 
##  Requirements

- [Terraform](https://github.com/hashicorp/terraform) (v0.9+)
- [Azure CLI](https://github.com/Azure/azure-cli) (2.0)
- [ACS Engine](https://github.com/Azure/acs-engine)

## Installation

### Pre-requisites

- Clone this project on your local machine;
- [Install Terraform](https://www.terraform.io/intro/getting-started/install.html)
- [Install Azure CLI 2.0](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Install K8S CLI](https://kubernetes.io/docs/tasks/kubectl/install/)
- [Install Docker CLI](https://docs.docker.com/docker-cloud/installing-cli/)
- [Install DCOS CLI](https://dcos.io/docs/1.8/usage/cli/install/)
- [Install the ACS Engine locally](https://github.com/Azure/acs-engine/blob/master/docs/acsengine.md#downloading-and-building-acs-engine-locally)
- Follow [Terraform's Azure setup guide, using the Azure CLI](https://www.terraform.io/docs/providers/azurerm/index.html#to-create-using-azure-cli), toward to fill *.tfvars* configuration with the azure _subscription/tenant/client id/client secret_ details.

### Initialize a Terraform configuration

The terraform `init` command is used to initialize a working directory containing Terraform configuration files. This is the first command that should be run after cloning from version control.

_NOTE:
  It is safe to run this command multiple times._

### Configuration

Configuration of the project is realised through Terraform variables file (e.g. `platform.tfvars`) with the following information for a minimal deployment:

```hcl-terraform
azure_subscription_id   = "<AZURE-SUBSCRIPTION-ID>"
azure_tenant_id         = "<AZURE-TENANT-ID>"
azure_client_id         = "<AZURE-CLIENT-ID>"
azure_client_secret     = "<AZURE-CLIENT-SECRET>"

orchestration_platform  = "<AZURE-ACS-PLATFORM>"

dns_prefix              = "<DNS-PREFIX>"
ssh_key                 = "<SSH-PUBLIC-KEY>"
```

#### Optional Fields

 Further to the above required configuration fields there is a set of optional fields to enable even more fine grained control on the deployed orchestrastion platform as presented in detail below :
 
```hcl-terraform
# general
azure_location              = "<AZURE-REGION>"
cluster_name                = "<CLUSTER-NAME>"
resource_group_name         = "<AZURE-RESOURCE-GROUP>"
deployment_profile          = "<DEPLOYMENT-PROFILE>"

# network configuration
virtual_network_name        = "<VIRTUAL-NETWORK-NAME>"
cidr                        = "<CIDR>"
cidr_subnet                 = "<SUBNET-CIDR>"

# service configuration
vm_size                     = "<VM-SIZE>"

master_vm_count             = <MASTER-VM-COUNT>
first_master_ip             = "<FIRST-MASTER-IP>"

worker_vm_count             = <WORKER-VM-COUNT>

admin_user                  = "<ADMIN-USER>"

diagnostics_profile_enabled = "<DIAGNOSTIC-PROFILE-ENABLED>"
```

#### Configuration examples

 The [platform.tfvars.example](https://github.com/ipolyzos/acs-engine-terraform/tree/master/platform.tfvars.example) serve as a complete generic template for different types of the ACS orchestration technologies. In the [examples folder](https://github.com/ipolyzos/acs-engine-terraform/tree/master/examples) concrete examples can be found for all [DCOS](https://github.com/ipolyzos/acs-engine-terraform/tree/master/examples/dcos.tfvars.example), [Kubernetes](https://github.com/ipolyzos/acs-engine-terraform/tree/master/examples/kubernetes.tfvars.example) and [Swarm](https://github.com/ipolyzos/acs-engine-terraform/tree/master/examples/swarm.tfvars.example) orchestration platforms.

### Platform deployment

 Since configuration is completed in order to proceed deploying the platform need to run the ```terraform apply``` command issuing the configucation file  e.g.
 
    terraform apply -var-file=platform.tfvars
 
### Platform clean-up

  Clean-up of a deployed platform can you done with the ```terraform destroy``` command issuing the configucation file  e.g.
                                                                                 
    terraform destroy -var-file=platform.tfvars
    
### Connect to the cluster

 Deployment of the platfomr output provide all the required information to connect in the cluster. Master note can be accessed at ```adminUser@master.fqdn``` e.g.
 
    ssh kubuser@master-kube.northeurope.cloudapp.azure.com

## References

- [Terraform](https://www.terraform.io)
- [Microsoft Azure](https://azure.microsoft.com/en-gb/)
- [Kubernetes](https://kubernetes.io/)
- [Docker](https://www.docker.com/)
- [DCOS](https://dcos.io/)

## Developing
 
 See the [contribution guidelines](https://github.com/ipolyzos/acs-engine-terraform/tree/master/CONTRIBUTING.md).

## Disclaimer 

 Please NOTE this work is still under development and not meant to be used in production.

## License

   Copyright 2017 Ioannis Polyzos

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
