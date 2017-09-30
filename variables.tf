###
# Required Parameters

variable "azure_subscription_id" {
  description = "Azure Subscription ID"
}

variable "azure_tenant_id" {
  description = "Azure Tenant ID"
}

variable "orchestration_platform" {
  description = "ACS Engine Platform to be deployed"
  default = "Kubernetes"
}

variable "ssh_key" {
  description = "SSH public key in PEM format to apply to VMs"
}

variable "azure_client_id" {
  description = "Azure Client ID"
}

variable "azure_client_secret" {
  description = "Azure Client Secret"
}

variable "dns_prefix" {
  description = "DNS prefix for the cluster"
}

###
# Optional Parameters

variable "azure_location" {
  description = "Azure Location, e.g. North Europe"
  default = "North Europe"
}

variable "cluster_name" {
  description = "Name of the cluster"
  default = "acs-engine-cluster"
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  default = "acs-engine-group"
}

variable "deployment_profile" {
  description = "Deployment Profule"
  default = "test"
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  default = "acs-engine_vnet"
}

variable "cidr" {
  description = "CIDR range of the VPC"
  default = "169.100.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR range of the only subnet in the VPC"
  default = "169.100.10.0/24"
}

variable "vm_size" {
  description = "Azure VM type"
  default = "Standard_A2"
}

variable "master_vm_count" {
  description = "Number of master VMs to create"
  default = 1
}

variable "first_master_ip" {
  description = "First IP address to be assigned to master nodes"
  default = "169.100.10.1"
}

variable "worker_vm_count" {
  description = "Number of worker VMs to initially create"
  default = 3
}

variable "admin_user" {
  description = "Administrative username for the VMs"
  default = "acsuser"
}

variable "diagnostics_profile_enabled" {
  description = "Diagnostics Profile"
  default = "false"
}

# FIX: simulate IF conditional
variable "kube" {
  type    = "list"
  default = ["kubernetes" ]
}

variable "swarm-dcos" {
  type    = "list"
  default = ["swarm", "swarmmode", "dcos" ]
}

variable "tags" {
  type = "map"
  default = {}
}