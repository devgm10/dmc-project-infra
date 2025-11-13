variable "container_group_name" {
  description = "Name of the container group"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
}

variable "acr_login_server" {
  description = "ACR login server"
  type        = string
}

variable "acr_admin_username" {
  description = "ACR admin username"
  type        = string
  sensitive   = true
}

variable "acr_admin_password" {
  description = "ACR admin password"
  type        = string
  sensitive   = true
}

variable "cpu" {
  description = "Number of CPU cores"
  type        = string
  default     = "1"
}

variable "memory" {
  description = "Memory in GB"
  type        = string
  default     = "1.5"
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
  default     = 8000
}

variable "dns_name_label" {
  description = "DNS name label for the container"
  type        = string
}

variable "restart_policy" {
  description = "Restart policy for the container"
  type        = string
  default     = "Always"
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = map(string)
  default     = {}
}

variable "secure_environment_variables" {
  description = "Secure environment variables for the container"
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
