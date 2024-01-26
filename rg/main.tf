# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
