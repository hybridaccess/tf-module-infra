module "test" {
  source                 = "../../."
  environment            = var.environment
  azurerm_resource_group = data.azurerm_resource_group.name
  frontend_ip            = var.frontend_ip
  name                   = var.cassandra_cluster_name
  location               = data.azurerm_resource_group.location
  cassandra_vnet_id      = data.azurerm_virtual_network.test.id
  cassandra_subnet_id    = data.azurerm_subnet.test.id
  cassandra_node_sku     = var.cassandra_node_sku
}
