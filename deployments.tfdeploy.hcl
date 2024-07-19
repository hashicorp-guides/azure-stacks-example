# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "production" {
  variables = {
    identity_token = identity_token.azurerm.jwt

    client_id       = "<Set to your Azure Client ID>"
    subscription_id = "<Set to your Azure Subscription ID>"
    tenant_id       = "<Set to your Azure Tenant ID>"
  }
}
