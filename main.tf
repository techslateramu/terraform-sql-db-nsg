# create test resource group
resource "azurerm_resource_group" "test" {
  name     = "test-rg"
  location = "East US"
}

module "sqlserver_single" {
  source = "./modules/sqlserver"
  rg_name = azurerm_resource_group.test.name
  rg_loc = azurerm_resource_group.location.name
}
