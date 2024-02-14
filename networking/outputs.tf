# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "nic_id" {
  value = azurerm_network_interface.example.id
}

output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}
