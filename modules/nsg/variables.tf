variable "nsg_name" {
  description = "The name of the Network Security Group"
  type        = string
}
variable "location" {
  description = "The location/region where the Network Security Group will be created"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the Resource Group where the Network Security Group will be created"
  type        = string
}