# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "tls_private_key" "example" {
  algorithm = "RSA"
}


resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-vm"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    var.nic_id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.example.public_key_openssh
  }
}
