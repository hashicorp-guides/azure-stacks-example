output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

variable "resource_group_location" {
  value = azurerm_resource_group.example.location
}
