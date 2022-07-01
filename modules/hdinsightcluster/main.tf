resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.rg_loc
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}
resource "azurerm_storage_container" "example" {
  name                  = var.storage_container
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = var.container_access_type
}
resource "azurerm_hdinsight_hadoop_cluster" "example" {
  name                  = var.hdinsight_hadoop_cluster_name
  resource_group_name   = var.rg_name
  location              = var.rg_loc
  cluster_version       = var.cluster_version
  tier                  = var.hdinsight_hadoop_cluster_tier
  tls_min_version       = var.min_tls_version
  # encryption_in_transit_enabled = var.encryption_in_transit_enabled
  # customer_managed_keys_encryption_at_rest_enabled = false
  dynamic "network" {
    for_each = var.hadoop_network != null ? [var.hadoop_network] : []
    content {
      connection_direction = var.hadoop_network.connection_direction
      private_link_enabled = var.hadoop_network.private_link_enabled
    }
  }

  component_version {
    hadoop = "2.7"
  }
  gateway {
    username            = var.gateway_username
    password            = var.gateway_password
  }
  storage_account {
    storage_container_id = azurerm_storage_container.example.id
    storage_account_key  = azurerm_storage_account.example.primary_access_key
    is_default           = true
  }
  roles {
    head_node {
      vm_size            = var.head_node_vm_size
      username           = var.head_node_username
      password           = var.head_node_password
    }

    worker_node {
      vm_size            = var.worker_node_vm_size
      username           = var.worker_node_username
      password           = var.worker_node_password
      target_instance_count = var.worker_node_target_instance_count
    }

    zookeeper_node {
      vm_size            = var.zookeeper_node_vm_size
      username           = var.zookeeper_node_username
      password           = var.zookeeper_node_password
    }
  }
}
