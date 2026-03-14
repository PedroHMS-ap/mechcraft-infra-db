variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where DB is provisioned"
  type        = string
  default     = "mechcraft-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central US"
}

variable "postgres_name" {
  description = "PostgreSQL flexible server name"
  type        = string
  default     = "mechcraft-pg"
}

variable "postgres_admin" {
  description = "PostgreSQL admin user"
  type        = string
  default     = "pgadmin"
}

variable "postgres_password" {
  description = "PostgreSQL admin password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Application database name"
  type        = string
  default     = "mechcraft"
}
