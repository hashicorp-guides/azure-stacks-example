# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

component "rg" {
  source = "./rg"

  inputs = {
    resource_group_name     = "stacks-example-resources"
    resource_group_location = "East US"
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

component "networking" {
  source = "./networking"

  inputs = {
    resource_group_name     = component.rg.resource_group_name
    resource_group_location = component.rg.resource_group_location
  }

  providers = {
    azurerm = provider.azurerm.this
  }
}

component "compute" {
  source = "./compute"

  inputs = {
    resource_group_name     = component.rg.resource_group_name
    resource_group_location = component.rg.resource_group_location
    nic_id                  = component.networking.nic_id
  }

  providers = {
    azurerm = provider.azurerm.this
    tls     = provider.tls.this
  }
}
