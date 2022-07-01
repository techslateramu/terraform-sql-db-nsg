# create test resource group
resource "azurerm_resource_group" "test" {
  name     = "test-rg123"
  location = "East US"
}

# module "mysqlserver" {
#   source = "./modules/mysqlserver"
#   rg_name = azurerm_resource_group.test.name
#   rg_loc = azurerm_resource_group.test.location
# }

# module "sqlserver_flex" {
#   source = "./modules/mysqlflexserver"
#   rg_name = azurerm_resource_group.test.name
#   rg_loc = azurerm_resource_group.test.location
# }

module "hdinsight_hadoop_cluster" {
  source = "./modules/hdinsightcluster"
  rg_name = azurerm_resource_group.test.name
  rg_loc = azurerm_resource_group.test.location
}