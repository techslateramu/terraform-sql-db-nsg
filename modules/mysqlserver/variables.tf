variable "sqlserver_name" {
    description = "Name of the mariadb server"
    type        =  string
    default     = "sql-server-test-1234"
}
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

variable "admin_name" {
    description = "Name of the admin username"
    type        = string
    default     = "mradministrator"
}

variable "password" {
    description = "Login password"
    type        = string
    default     = "thisIsDog11"
}

variable "sql_version" {
    description = "Specifies the version of MySQL to use"
    type        = number
    default     = "5.7"
}

variable "public_network_access" {
    description = "Whether or not public network access is allowed for this server"
    type        = bool
    default     = "true"
}

variable "ssl_enforcement" {
    description = "Specifies if SSL should be enforced on connections"
    type        = bool
    default     = "true"
}

variable "force_ssl_minimal_version" {
  description = "The minimal SSL version enforced"
  type        = string
  default     = "TLS1_2"
}

variavle "sku_name" {
    description = "Specifies the SKU Name for this MySQL Server"
    type        = "string"
    default     = "B_Gen5_2"
}
