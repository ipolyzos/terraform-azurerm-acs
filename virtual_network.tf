# Azure Virtual Network
resource "azurerm_virtual_network" "default" {
  name                = "${var.virtual_network_name}"
  address_space       = ["${var.cidr}"]
  location            = "${var.azure_location}"
  resource_group_name = "${var.resource_group_name}"

  depends_on = ["azurerm_resource_group.default"]

  tags = "${merge(var.tags, map("Type", "Virtual Network",
                                "Environment","${var.deployment_profile}"))}"
}

# Azure Virtual Network - Subnet
resource "azurerm_subnet" "default" {
  name                 = "${var.virtual_network_name}_subnet"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.default.name}"
  address_prefix       = "${var.cidr_subnet}"

  depends_on = ["azurerm_virtual_network.default"]

}