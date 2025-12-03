variable "vm_name" {
  description = "The name of the Linux Virtual Machine"
  type        = string
  
}
variable "resource_group_name" {
  description = "The name of the Resource Group where the Linux VM will be created"
  type        = string
}
variable "location" {
  description = "The location/region where the Linux VM will be created"
  type        = string
}
variable "vm_size" {
  description = "The size of the Linux Virtual Machine"
  type        = string
}
variable "admin_username" {
  description = "The admin username for the Linux VM"
  type        = string
}
variable "admin_ssh_key" {
  description = "The public SSH key for the admin user"
  type        = string
}
variable "network_interface_id" {
  description = "The ID of the Network Interface to attach to the Linux VM"
  type        = string
}
variable "subnet_id" {
description = "The ID of the Subnet where the Network Interface will be created"
type        = string
  
}