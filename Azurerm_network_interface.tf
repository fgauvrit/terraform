resource "azurerm_network_interface" "example" {
  count               = var.vm_count
  name                = "${var.vm_name_pfx}-${count.index}-nic"
  location            = data.azurerm_resource_group.GroupeN.location
  resource_group_name = data.azurerm_resource_group.GroupeN.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }

  tags = {
    environment = "Ecole_CAP_Azure"
    session     = "1"
    groupe      = "0"
  }
}
