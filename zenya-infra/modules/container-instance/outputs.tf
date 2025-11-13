output "container_group_id" {
  description = "ID of the container group"
  value       = azurerm_container_group.main.id
}

output "fqdn" {
  description = "FQDN of the container instance"
  value       = azurerm_container_group.main.fqdn
}

output "ip_address" {
  description = "Public IP address of the container"
  value       = azurerm_container_group.main.ip_address
}
