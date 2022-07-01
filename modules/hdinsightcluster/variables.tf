variable "rg_loc" {
    description = "location where the resources will be created"
    type        =  string
    default     = "East US"
}

variable "rg_name" {
    description = "Name of the resource group"
    type        =  string
    default     = ""
}

variable "storage_account_name" {
    description = "Name of the storage account"
    type        = string
    default     = "hdinsightstor1234"
}

variable "account_tier" {
    description = "Name of the storage_account_tier"
    type        = string
    default     = "Standard"  
}

variable "account_replication_type" {
    description = "Name of the account_replication_type"
    type        = string
    default = "LRS"  
}

variable "storage_container" {
    description = "Name of the storage container"
    type        = string
    default     = "hdinsight"  
}

variable "container_access_type" {
    description = "Type of storage container access"
    type        = string
    default     = "private"  
}
variable "hdinsight_hadoop_cluster_name" {
    description = "Name of the hdinsight_hadoop_cluster"
    type        = string
    default     = "example-hdicluster1234"  
}

variable "cluster_version" {
    description = "Version of cluster"
    type        = number
    default     = "3.6"  
}

variable "hdinsight_hadoop_cluster_tier" {
    description = "Name of the hdinsight_hadoop_cluster_tier"
    type        = string
    default     = "Standard"  
}

variable "min_tls_version" {
    description = "The minimal supported TLS version"
    type        = number
    default     = 1.2 
}

variable "hadoop_network" {
  type = object({
    connection_direction = string
    private_link_enabled = bool
  })
  description = "Specify the networking and private endpoint configuration"
  default = (
    {
        connection_direction = "Inbound"
        private_link_enabled = true
    }
  )
}

#  variable "encryption_in_transit_enabled" {
#     description = "Is the encryption transit enabled? Possible values True or False"
#     type        = bool
#     default     = false   
#  }
 
variable "gateway_username" {
    description = "Name of the gateway user"
    type        = string
    default     = "acctestusrgw"  
}

variable "gateway_password" {
    description = "Password for gateway"
    type        = string
    default     = "TerrAform123!"  
}

variable "head_node_vm_size" {
    description = "The Size of the Virtual Machine which should be used as the headnodes"
    type        = string
    default     = "Standard_D3_V2"  
}

variable "head_node_username" {
    description = "The Username of the local administrator for the headnodes"
    type        = string
    default     = "valueacctestusrvm"  
}

variable "head_node_password" {
    description = "The password of the local administrator for the headnodes"
    type        = string
    default     = "AccTestvdSC4daf986!"  
}

variable "worker_node_vm_size" {
    description = "The Size of the Virtual Machine which should be used as the workernodes"
    type        = string
    default     = "Standard_D4_V2"  
}

variable "worker_node_username" {
    description = "The Username of the local administrator for the workernodes"
    type        = string
    default     = "acctestusrvm"  
}

variable "worker_node_password" {
    description = "The password of the local administrator for the workernodes"
    type        = string
    default     = "AccTestvdSC4daf986!"  
}

variable "worker_node_target_instance_count" {
    description = "The number of instances which should be run for the Worker Nodes"
    type        = number
    default     = 3 
}

variable "zookeeper_node_vm_size" {
    description = "The Size of the Virtual Machine which should be used as the zookeepernode"
    type        = string
    default     = "Standard_D3_V2"  
}

variable "zookeeper_node_username" {
    description = "The Username of the local administrator for the zookeepernodes"
    type        = string
    default     = "acctestusrvm"  
}

variable "zookeeper_node_password" {
    description = "The password of the local administrator for the zookeepernodes"
    type        = string
    default     = "AccTestvdSC4daf986!"  
}