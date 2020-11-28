variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default     = "MH"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default     = "East US"
}

variable "resource_group_name" {
  type        = string
  description = "The name of Azure resource group"
  default     = "udacityProj"
}

variable "admin_username" {
  description = "The Virtual machine admin username"
  default     = "adminuser"
}

variable "admin_password" {
  description = "The Virtual admin Machine password"
  default     = "P@ssW0rd1"
}

variable "vm_count" {
  type        = number
  description = "The number of virtual machines to create"
  default     = 2
}

variable "imageid" {
  description = "The ID of the Packer Image created."
  default     = "udPackerImage"
}
