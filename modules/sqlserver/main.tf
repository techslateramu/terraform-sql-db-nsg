resource "azurerm_sql_server" "example" {
  name                         = var.sqlserver_name
  resource_group_name          = var.rg_name
  location                     = var.rg_loc
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  tags = {
    environment = "testing"
  }
}