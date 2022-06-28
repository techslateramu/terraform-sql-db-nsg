variable "sqlserver_name" {
    description = "Name of the mariadb server"
    type =  string
    default = "sql-server-test-001"
}
variable "rg_loc" {
    description = "location where the resources will be created"
    type =  string
    default = "East US"
}

variable "rg_name" {
    description = "Name of the resource group"
    type =  string
    default = ""
}