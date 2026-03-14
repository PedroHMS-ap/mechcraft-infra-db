data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

resource "azurerm_postgresql_flexible_server" "this" {
  name                          = var.postgres_name
  resource_group_name           = data.azurerm_resource_group.this.name
  location                      = var.location
  administrator_login           = var.postgres_admin
  administrator_password        = var.postgres_password
  sku_name                      = "B_Standard_B1ms"
  version                       = "13"
  storage_mb                    = 32768
  public_network_access_enabled = true
  auto_grow_enabled             = false

  lifecycle {
    ignore_changes = [
      zone,
      high_availability,
    ]
  }
}

resource "azurerm_postgresql_flexible_server_configuration" "timezone" {
  name      = "timezone"
  server_id = azurerm_postgresql_flexible_server.this.id
  value     = "UTC"
}

resource "azurerm_postgresql_flexible_server_database" "app" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.this.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "allow_azure_services" {
  name             = "allow-azure-services"
  server_id        = azurerm_postgresql_flexible_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
