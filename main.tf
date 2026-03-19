terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "tfghactionsstatec1137c"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
    use_azuread_auth     = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-aks" {
  name     = var.resource_group_name
  location = var.location
}

# Database モジュール（Azure SQL Database + Key Vault）
module "database" {
  source = "./modules/database"

  resource_group_name   = azurerm_resource_group.rg-aks.name
  location              = azurerm_resource_group.rg-aks.location
  sql_server_name       = var.sql_server_name
  sql_database_name     = var.sql_database_name
  sql_admin_login       = var.sql_admin_login
  sql_admin_password    = var.sql_admin_password
  key_vault_name        = var.key_vault_name
  tenant_id             = var.tenant_id
  sql_database_sku_name = var.sql_database_sku_name
  tags                  = var.tags
}
