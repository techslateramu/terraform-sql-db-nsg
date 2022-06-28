resource "azurerm_mssql_server" "example" {
  name                         = var.sqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.rg_loc
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  public_network_access_enabled     = true

  tags = {
    environment = "testing"
  }
}