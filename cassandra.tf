module "cassandra" {
  source                 = "github.com/hybridaccess/tf-module-cassandra.git?ref=master"
  env                    = var.environment
  azurerm_resource_group = var.azurerm_resource_group
  lb_frontend_ip         = var.frontend_ip
  name                   = var.cassandra_cluster_name
  location               = var.location
  cassandra_vnet_id      = var.cassandra_vnet_id
  cassandra_subnet_id    = var.cassandra_subnet_id
  node_sku               = var.cassandra_node_sku
}


