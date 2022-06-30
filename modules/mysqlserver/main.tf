resource "azurerm_mysql_server" "example" {
  name                              = var.sqlserver_name
  resource_group_name               = var.rg_name
  location                          = var.rg_loc
  version                           = var.sql_version
  administrator_login               = var.admin_name
  administrator_login_password      = var.password
  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  sku_name                          = var.sku_name
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  tags = {
    environment = "testing"
  }
}
