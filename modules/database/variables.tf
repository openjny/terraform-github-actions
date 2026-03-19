variable "resource_group_name" {
  description = "リソースグループ名"
  type        = string
}

variable "location" {
  description = "Azure リージョン"
  type        = string
}

variable "sql_server_name" {
  description = "SQL Server 名（例: sql-myproject-prod）"
  type        = string
}

variable "sql_database_name" {
  description = "SQL Database 名"
  type        = string
}

variable "sql_admin_login" {
  description = "SQL 管理者ログイン名"
  type        = string
}

variable "sql_admin_password" {
  description = "SQL 管理者パスワード"
  type        = string
  sensitive   = true
}

variable "key_vault_name" {
  description = "Key Vault 名（例: kv-myproject-prod）"
  type        = string
}

variable "tenant_id" {
  description = "Azure AD テナント ID"
  type        = string
}

variable "sql_database_sku_name" {
  description = "SQL Database SKU"
  type        = string
  default     = "S0"
}

variable "tags" {
  description = "リソースタグ（environment, managed_by, project）"
  type        = map(string)
  default     = {}
}
