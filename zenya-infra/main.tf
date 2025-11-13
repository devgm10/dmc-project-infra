# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.project_name}-${var.environment}"
  location = var.location

  tags = local.common_tags
}

# PostgreSQL Database
module "postgresql" {
  source = "./modules/postgresql"

  server_name           = "psql-${var.project_name}-${var.environment}"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  postgres_version      = "15"
  admin_username        = var.db_admin_username
  admin_password        = var.db_admin_password
  database_name         = var.database_name
  sku_name              = "B_Standard_B1ms"
  storage_mb            = 32768
  backup_retention_days = 7
  tags                  = local.common_tags
}

# Container Instance for Backend (using Docker Hub directly)
resource "azurerm_container_group" "backend" {
  name                = "aci-${var.project_name}-backend-${var.environment}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  os_type             = "Linux"
  restart_policy      = "Always"
  ip_address_type     = "Public"
  dns_name_label      = "${var.project_name}-backend-${var.environment}"

  container {
    name   = "zenya-backend"
    image  = "${var.dockerhub_username}/${var.backend_image_name}:${var.backend_image_tag}"
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 8000
      protocol = "TCP"
    }

    environment_variables = {
      ALLOWED_HOSTS = "*"
      DEBUG         = "False"
    }

    secure_environment_variables = {
      POSTGRES_HOST     = module.postgresql.server_fqdn
      POSTGRES_DB       = module.postgresql.database_name
      POSTGRES_USER     = var.db_admin_username
      POSTGRES_PASSWORD = var.db_admin_password
      POSTGRES_PORT     = "5432"
      DJANGO_SECRET_KEY = var.django_secret_key
    }
  }

  image_registry_credential {
    server   = "index.docker.io"
    username = var.dockerhub_username
    password = var.dockerhub_token
  }

  tags = local.common_tags
  
  depends_on = [
    module.postgresql
  ]
}

# Local values
locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}