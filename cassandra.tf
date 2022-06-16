resource "azurerm_resource_group" "this" {
  location = var.location
  name     = "${var.name}-rg"

  tags = {
    dept = "IT"
  }
}

module "cassandra" {
  source                 = "git@github.com:hybridaccess/tf-module-cassandra.git?ref=master"
  name                   = "cassandra-mi"
  env                    = var.environment
  location               = azurerm_resource_group.this.location
  azurerm_resource_group = azurerm_resource_group.this.name
  cassandra_vnet_id      = azurerm_virtual_network.this.id
  cassandra_subnet_id    = azurerm_subnet.this.id
  node_sku               = var.cassandra_node_sku
  lb_frontend_ip         = var.frontend_ip
  name                   = var.cassandra_cluster_name
  env                    = var.environment
  location               = azurerm_resource_group.this.location
  azurerm_resource_group = azurerm_resource_group.this.name
  cassandra_vnet_id      = var.cassandra_vnet_id
  cassandra_subnet_id    = var.cassandra_subnet_id
  node_sku               = var.cassandra_node_sku
  lb_frontend_ip         = var.cassandra_lb_frontend_ip
  enable_hybrid_cluster  = var.cassandra_enable_hybrid_cluster
  external_seed_nodes    = var.cassandra_enable_hybrid_cluster ? var.cassandra_external_seed_nodes : null
}


