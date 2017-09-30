# Azure ACS Engine
resource "azurerm_container_service" "kubernetes-service" {
  count                  = "${(contains(var.kube,lower(var.orchestration_platform))) ? 1 : 0 }"

  name                   = "${var.cluster_name}"
  location               = "${var.azure_location}"
  resource_group_name    = "${var.resource_group_name}"
  orchestration_platform = "${var.orchestration_platform}"

  master_profile {
    count      = "${var.master_vm_count}"
    dns_prefix = "master-${var.dns_prefix}"
  }

  linux_profile {
    admin_username = "${var.admin_user}"

    ssh_key {
      key_data = "${var.ssh_key}"
    }
  }

  agent_pool_profile {
    name       = "workers"
    count      = "${var.worker_vm_count}"
    dns_prefix = "agent-${var.dns_prefix}"
    vm_size    = "${var.vm_size}"
  }

  service_principal {
    client_id     = "${var.azure_client_id}"
    client_secret = "${var.azure_client_secret}"
  }

  diagnostics_profile {
    enabled = "${var.diagnostics_profile_enabled}"
  }

  tags = "${merge(var.tags, map("Type", "Orchestration Technology",
                                "Environment","${var.deployment_profile}"))}"

  depends_on = ["azurerm_subnet.default"]
}

resource "azurerm_container_service" "swarm-dcos-service" {
  count                  = "${(contains(var.swarm-dcos,lower(var.orchestration_platform))) ? 1 : 0}"

  name                   = "${var.cluster_name}"
  location               = "${var.azure_location}"
  resource_group_name    = "${var.resource_group_name}"
  orchestration_platform = "${var.orchestration_platform}"

  master_profile {
    count      = "${var.master_vm_count}"
    dns_prefix = "master-${var.dns_prefix}"
  }

  linux_profile {
    admin_username = "${var.admin_user}"

    ssh_key {
      key_data = "${var.ssh_key}"
    }
  }

  agent_pool_profile {
    name       = "workers"
    count      = "${var.worker_vm_count}"
    dns_prefix = "agent-${var.dns_prefix}"
    vm_size    = "${var.vm_size}"
  }

  diagnostics_profile {
    enabled = "${var.diagnostics_profile_enabled}"
  }

  tags = "${merge(var.tags, map("Type", "Orchestration Technology",
                                "Environment","${var.deployment_profile}"))}"

  depends_on = ["azurerm_subnet.default"]
}