variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "khulnasoft_volscan_scan_locations" {
  type        = list(string)
  description = "KhulnaSoft list of volume scanning locations"
}

variable "khulnasoft_volscan_resource_group_name" {
  type        = string
  description = "KhulnaSoft volume scanning Resource Group Name"
}

variable "khulnasoft_virtual_network_name" {
  type        = string
  description = "KhulnaSoft volume scanning virtual network name"
}

variable "khulnasoft_network_security_group_name" {
  type        = string
  description = "KhulnaSoft volume scanning network security group name"
}

variable "khulnasoft_subnet_name" {
  type        = string
  description = "KhulnaSoft volume scanning subnet name"
}
