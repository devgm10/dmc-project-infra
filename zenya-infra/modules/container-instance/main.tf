resource "azurerm_container_group" "main" {
  name                = var.container_group_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  restart_policy      = var.restart_policy
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label

  image_registry_credential {
    server   = var.acr_login_server
    username = var.acr_admin_username
    password = var.acr_admin_password
  }

  container {
    name   = var.container_name
    image  = var.docker_image
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = var.container_port
      protocol = "TCP"
    }

    dynamic "environment_variables" {
      for_each = var.environment_variables
      content {
        name  = environment_variables.key
        value = environment_variables.value
      }
    }

    dynamic "secure_environment_variables" {
      for_each = var.secure_environment_variables
      content {
        name  = secure_environment_variables.key
        value = secure_environment_variables.value
      }
    }
  }

  tags = var.tags
}
