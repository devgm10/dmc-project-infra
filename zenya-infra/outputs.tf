output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "backend_url" {
  description = "URL of the backend API"
  value       = "http://${azurerm_container_group.backend.fqdn}:8000"
}

output "backend_fqdn" {
  description = "FQDN of the backend"
  value       = azurerm_container_group.backend.fqdn
}

output "backend_ip" {
  description = "Public IP of the backend"
  value       = azurerm_container_group.backend.ip_address
}

output "database_fqdn" {
  description = "FQDN of the PostgreSQL server"
  value       = module.postgresql.server_fqdn
}

output "database_name" {
  description = "Name of the database"
  value       = module.postgresql.database_name
}
