identity_token "azurerm" {
  audience = ["api://AzureADTokenExchange"]
}

deployment "production" {
  variables = {
    identity_token_file = identity_token.azurerm.jwt_filename
  }
}
