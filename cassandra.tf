resource "azurerm_resource_group" "this" {
  location = var.location
  name     = "${var.name}-rg"

  tags = {
    dept = "IT"
  }
}

module "cassandra" {
  source                 = "git@github.com:hybridaccess/tf-module-cassandra.git?ref=master"
  env                    = var.environment
  azurerm_resource_group = azurerm_resource_group.this.name
  lb_frontend_ip         = var.frontend_ip
  name                   = var.cassandra_cluster_name
  location               = azurerm_resource_group.this.location
  cassandra_vnet_id      = var.cassandra_vnet_id
  cassandra_subnet_id    = var.cassandra_subnet_id
  node_sku               = var.cassandra_node_sku
}


