variable "vm_count" {
  description = "Number of Virtual Machines"
  default     = 0
  type        = string
}

variable "vm_name_pfx" {
  description = "VM Names"
  default     = "vm-grp1"
  type        = string
}


resource "azurerm_linux_virtual_machine" "example" {
  count                           = var.vm_count
  name                            = "${var.vm_name_pfx}-${count.index}"
  resource_group_name             = data.azurerm_resource_group.GroupeN.name
  location                        = data.azurerm_resource_group.GroupeN.location
  size                            = "Standard_B1s" #allowed: Standard_B1ls Standard_B1ms Standard_B1s Standard_B2s Standard_D2s_v3 Standard_DS1_v2
  computer_name                   = "myvm"
  admin_username                  = "adminuser"
  admin_password                  = "Password1234!"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.example[count.index].id,
  ]

  os_disk {
    name                 = "my-terraform-os-disk-${var.vm_name_pfx}-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  tags = {
    environment = "Ecole_CAP_Azure"
    session     = "1"
    groupe      = "0"
  }
}