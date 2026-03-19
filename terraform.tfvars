# Sample values
resource_group_name = "rg-terraform-github-actions"
location            = "eastus"

# Database モジュール用
sql_server_name   = "sql-terraform-github-actions-prod"
sql_database_name = "sqldb-terraform-github-actions-prod"
sql_admin_login   = "sqladmin"
# Key Vault 名は24文字制限があるためプロジェクト名を省略
key_vault_name        = "kv-tfghactions-prod"
tenant_id             = "00000000-0000-0000-0000-000000000000"
sql_database_sku_name = "S0"

tags = {
  environment = "prod"
  managed_by  = "terraform"
  project     = "terraform-github-actions"
}
