# create test resource group
resource "azurerm_resource_group" "test" {
  name     = "test-rg"
  location = "East US"
}

module "mysql_singleserver" {
  source = "./modules/mysqlserver"
  rg_name = azurerm_resource_group.test.name
  rg_loc = azurerm_resource_group.test.location
}