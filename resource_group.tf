# Azure Resource Group
resource "azurerm_resource_group" "default" {
  name     = "${var.resource_group_name}"
  location = "${var.azure_location}"

  tags = "${merge(var.tags, map("Resource Type", "Resource Group",
                                "Environment","${var.deployment_profile}"))}"
}