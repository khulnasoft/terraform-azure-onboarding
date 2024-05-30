variable "khulnasoft_bucket_name" {
  type        = string
  description = "KhulnaSoft Bucket Name"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "onboarding_type" {
  type        = string
  description = "The type of onboarding"
}

variable "management_group_id" {
  type        = string
  description = "KhulnaSoft Management Group ID"
}

variable "principal_id" {
  type        = string
  description = "The ID of the Service Principal to assign the Role Definition to"
}

variable "application_id" {
  type        = string
  description = "Application ID - represented by the Service principal client ID associated with the application"
}

variable "application_password" {
  type        = string
  sensitive   = true
  description = "Application password"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "khulnasoft_custom_tags" {
  type        = map(string)
  description = "Client Additional Resource Tags"
}

variable "khulnasoft_volscan_resource_group_name" {
  type        = string
  description = "KhulnaSoft volume scanning Resource Group Name"
}

variable "khulnasoft_volscan_resource_group_location" {
  type        = string
  description = "KhulnaSoft volume scanning Resource Group Location"
}

variable "create_network" {
  type        = bool
  description = "Whether to create the network resources"
}

variable "khulnasoft_volscan_scan_locations" {
  type        = list(string)
  description = "KhulnaSoft volume scanning locations"
}

variable "khulnasoft_virtual_network_name" {
  type        = string
  description = "KhulnaSoft volume scanning virtual network name"
}

variable "khulnasoft_network_security_group_name" {
  type        = string
  description = "KhulnaSoft network security group name"
}

variable "khulnasoft_subnet_name" {
  type        = string
  description = "KhulnaSoft volume scanning subnet name"
}

variable "khulnasoft_system_topics_name" {
  type        = string
  description = "KhulnaSoft Event Grid System Topics"
}

variable "khulnasoft_event_subscriptions_name" {
  type        = string
  description = "KhulnaSoft Event Subscriptions Name"
}

variable "khulnasoft_volscan_api_url" {
  type        = string
  description = "KhulnaSoft volume scan API URL"
}

variable "khulnasoft_volscan_api_token" {
  type        = string
  sensitive   = true
  description = "KhulnaSoft volume scanning API token"
}

variable "khulnasoft_api_key" {
  type        = string
  sensitive   = true
  description = "KhulnaSoft API key"
}

variable "khulnasoft_api_secret" {
  type        = string
  sensitive   = true
  description = "KhulnaSoft API secret key"
}

variable "khulnasoft_autoconnect_url" {
  type        = string
  description = "KhulnaSoft AutoConnect URL"
}

variable "khulnasoft_cspm_group_id" {
  type        = string
  description = "CSPM group id"
}

variable "khulnasoft_configuration_id" {
  type        = string
  description = "KhulnaSoft configuration id"
}