variable "environment" {
  description = "Environment name (staging, production)"
  type        = string
  default     = "staging"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralus"
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "zenya"
}

variable "dockerhub_username" {
  description = "DockerHub username"
  type        = string
}

variable "dockerhub_token" {
  description = "DockerHub Personal Access Token or password"
  type        = string
  sensitive   = true
}

variable "backend_image_name" {
  description = "Name of the backend Docker image"
  type        = string
  default     = "zenya-backend"
}

variable "backend_image_tag" {
  description = "Tag of the backend Docker image"
  type        = string
  default     = "latest"
}

variable "db_admin_username" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "admindb"
}

variable "db_admin_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  default     = "zenyadb"
}

variable "django_secret_key" {
  description = "Django SECRET_KEY"
  type        = string
  sensitive   = true
}
