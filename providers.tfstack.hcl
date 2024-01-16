required_providers {
  azurerm = {
    source  = "hashicorp/azurerm"
    version = "~> 3.87.0"
  }

  http = {
    source  = "hashicorp/http"
    version = "~> 3.4.1"
  }
}

provider "azurerm" "this" {}
provider "http" "this" {}
