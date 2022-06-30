resource "azurerm_virtual_network" "example" {
  name                = "example-vn"
  location            = var.rg_loc
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "example" {
  name                 = "example-sn"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforMySQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}
resource "azurerm_private_dns_zone" "example" {
  name                = "example.mysql.database.azure.com"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = azurerm_virtual_network.example.id
  resource_group_name   = var.rg_name
}

resource "azurerm_mysql_flexible_server" "example" {
  name                          = var.sqlflexserver_name
  resource_group_name           = var.rg_name
  location                      = var.rg_loc
  administrator_login           = var.admin_name
  administrator_password        = var.password
  backup_retention_days         = 7
  delegated_subnet_id           = azurerm_subnet.example.id
  private_dns_zone_id           = azurerm_private_dns_zone.example.id
  sku_name                      = var.sku_name
  # public_network_access_enabled = var.public_network_access_enabled

  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
}