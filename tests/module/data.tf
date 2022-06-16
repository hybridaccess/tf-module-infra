data "azurerm_resource_group" "test" {
  name = "poc-cassandra1"
}

data "azurerm_virtual_network" "test" {
  name                = "poc-cassandra"
  resource_group_name = data.azurerm_resource_group.test.name
}

data "azurerm_subnet" "test" {
  name                 = "default"
  resource_group_name  = data.azurerm_resource_group.test.name
  virtual_network_name = data.azurerm_virtual_network.test.name
}