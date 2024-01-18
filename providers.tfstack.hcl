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

variable "identity_token_file" {
  type = string
}


provider "azurerm" "this" {
  config {
    use_oidc             = true
    oidc_token_file_path = var.identity_token_file
  }
}

provider "http" "this" {}
