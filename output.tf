# Azure ACS output
output "virtualnetwork_subnet_default_id" {
  value = "${azurerm_subnet.default.id}"
}

# kubernetes service
output "kubernetes.orchestration_platform" {
  value = "${azurerm_container_service.kubernetes-service.orchestration_platform}"
}

output "kubernetes.resource_group_name" {
  value = "${azurerm_container_service.kubernetes-service.resource_group_name}"
}

output "kubernetes.agent_pool_profile" {
  value = "${azurerm_container_service.kubernetes-service.agent_pool_profile}"
}

output "kubernetes.location" {
  value = "${azurerm_container_service.kubernetes-service.location}"
}

output "kubernetes.linux_profile" {
  value = "${azurerm_container_service.kubernetes-service.linux_profile}"
}

output "kubernetes.master_profile" {
  value = "${azurerm_container_service.kubernetes-service.master_profile}"
}

output "kubernetes.provider" {
  value = "${azurerm_container_service.kubernetes-service.provider}"
}

output "kubernetes.provisioner" {
  value = "${azurerm_container_service.kubernetes-service.provisioner}"
}

output "kubernetes.connection" {
  value = "${azurerm_container_service.kubernetes-service.connection}"
}

output "kubernetes.lifecycle" {
  value = "${azurerm_container_service.kubernetes-service.lifecycle}"
}

output "kubernetes.service_principal" {
  value = "${azurerm_container_service.kubernetes-service.service_principal}"
}

# swarm-dcos service

output "swarm-dcos.orchestration_platform" {
  value = "${azurerm_container_service.swarm-dcos-service.orchestration_platform}"
}

output "swarm-dcos.resource_group_name" {
  value = "${azurerm_container_service.swarm-dcos-service.resource_group_name}"
}

output "swarm-dcos.agent_pool_profile" {
  value = "${azurerm_container_service.swarm-dcos-service.agent_pool_profile}"
}

output "swarm-dcos.location" {
  value = "${azurerm_container_service.swarm-dcos-service.location}"
}

output "swarm-dcos.linux_profile" {
  value = "${azurerm_container_service.swarm-dcos-service.linux_profile}"
}

output "swarm-dcos.master_profile" {
  value = "${azurerm_container_service.swarm-dcos-service.master_profile}"
}

output "swarm-dcos.provider" {
  value = "${azurerm_container_service.swarm-dcos-service.provider}"
}

output "swarm-dcos.provisioner" {
  value = "${azurerm_container_service.swarm-dcos-service.provisioner}"
}

output "swarm-dcos.connection" {
  value = "${azurerm_container_service.swarm-dcos-service.connection}"
}

output "swarm-dcos.lifecycle" {
  value = "${azurerm_container_service.swarm-dcos-service.lifecycle}"
}

output "swarm-dcos.service_principal" {
  value = "${azurerm_container_service.swarm-dcos-service.service_principal}"
}