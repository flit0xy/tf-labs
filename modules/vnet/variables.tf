variable "vnet_name" {
description = "The name of the virtual network."
type        = string 
}
variable "address_space" {
description = "The address space that is used by the virtual network."
type        = list(string)
}
variable "location" {
description = "The Azure region where the Virtual Network will be created."
type        = string
}
variable "resource_group_name" {
description = "The name of the resource group in which to create the virtual network."
type        = string
}