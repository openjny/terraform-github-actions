output "sql_server_id" {
  description = "SQL Server の ID"
  value       = azurerm_mssql_server.main.id
}

output "sql_server_fqdn" {
  description = "SQL Server の FQDN"
  value       = azurerm_mssql_server.main.fully_qualified_domain_name
}

output "sql_database_id" {
  description = "SQL Database の ID"
  value       = azurerm_mssql_database.main.id
}

output "key_vault_id" {
  description = "Key Vault の ID"
  value       = azurerm_key_vault.main.id
}

output "key_vault_uri" {
  description = "Key Vault の URI"
  value       = azurerm_key_vault.main.vault_uri
}
