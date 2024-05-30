variable "khulnasoft_volscan_api_token" {
  type        = string
  sensitive   = true
  description = "KhulnaSoft volume scanning API token"
}

variable "khulnasoft_cspm_group_id" {
  type        = string
  description = "KhulnaSoft CSPM group ID"
}

variable "khulnasoft_custom_tags" {
  type        = map(string)
  description = "KhulnaSoft Client Additional Resource Tags"
}

variable "khulnasoft_cspm_url" {
  type        = string
  description = "KhulnaSoft CSPM group url"
}

variable "subscription_ids" {
  type        = list(string)
  description = "List of the Management Group subscriptions"
}

variable "khulnasoft_bucket_name" {
  type        = string
  description = "KhulnaSoft Bucket Name"
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

variable "khulnasoft_volscan_resource_group_location" {
  type        = string
  description = "KhulnaSoft volume scanning Resource Group Location"
}

variable "management_group_id" {
  type        = string
  description = "Management Group ID - Relevant when onboarding_type is management-group"
}

variable "service_principal_id" {
  type        = string
  description = "The ID of the Service Principal to assign the Role Definition to"
}

variable "khulnasoft_volscan_api_url" {
  type        = string
  description = "KhulnaSoft volume scan API URL"
}

variable "khulnasoft_system_topics_name" {
  type        = string
  default     = "khulnasoft-agentless-scanner"
  description = "KhulnaSoft volume scanning Event Grid System Topic Name"
}

variable "khulnasoft_event_subscriptions_name" {
  type        = string
  default     = "khulnasoft-agentless-scanner"
  description = "KhulnaSoft volume scanning Event Subscriptions Name"
}

variable "khulnasoft_subnet_name" {
  type        = string
  default     = "khulnasoft-agentless-scanner"
  description = "KhulnaSoft volume scanning Subnet Name"
}

variable "khulnasoft_volscan_resource_group_name" {
  type        = string
  default     = "khulnasoft-agentless-scanner"
  description = "KhulnaSoft volume scanning Resource Group Name"
}

variable "khulnasoft_api_secret" {
  type        = string
  sensitive   = true
  description = "KhulnaSoft API secret key"
}

variable "khulnasoft_api_key" {
  type        = string
  sensitive   = true
  description = "KhulnaSoft API key"
}

variable "khulnasoft_autoconnect_url" {
  type        = string
  description = "KhulnaSoft AutoConnect URL"
}

variable "khulnasoft_configuration_id" {
  type        = string
  description = "KhulnaSoft configuration id"
}

variable "khulnasoft_network_security_group_name" {
  type        = string
  description = "KhulnaSoft volume scanning Network Security Group Name"
}

variable "khulnasoft_virtual_network_name" {
  type        = string
  description = "KhulnaSoft volume scanning Virtual Network Name"
}

variable "khulnasoft_volscan_scan_locations" {
  type        = list(string)
  description = "List of Azure locations to scan"
}

