variable "onboarding_type" {
  type = string
  validation {
    condition     = var.onboarding_type == "single-subscription" || var.onboarding_type == "management-group"
    error_message = "Only 'single-subscription' or 'management-group' onboarding types are supported"
  }
  description = "The type of onboarding. Valid values are 'single-subscription' or 'management-group' onboarding types"
}

variable "khulnasoft_bucket_name" {
  description = "KhulnaSoft Bucket Name"
  type        = string
  validation {
    condition     = length(var.khulnasoft_bucket_name) > 0
    error_message = "KhulnaSoft Bucket Name must not be empty"
  }
}

variable "management_group_id" {
  type        = string
  default     = ""
  description = "KhulnaSoft Management Group ID - Relevant when onboarding_type is management-group"
}

variable "khulnasoft_custom_tags" {
  type        = map(string)
  default     = {}
  description = "Client additional resource tags"
}

variable "khulnasoft_volscan_resource_group_name" {
  type        = string
  default     = "khulnasoft-agentless-scanner"
  description = "KhulnaSoft volume scanning Resource Group Name"
}

variable "khulnasoft_volscan_resource_group_location" {
  type        = string
  default     = "eastus"
  description = "KhulnaSoft volume scanning Resource Group Location"
}

variable "khulnasoft_cspm_role_name" {
  type        = string
  default     = ""
  description = "KhulnaSoft AutoConnect Scanner Role Name - The default value will be calculated as 'KhulnaSoft_Auto_Discovery_Scanner_Role_<subscription_id>'"
}

variable "create_network" {
  type        = bool
  default     = true
  description = "Toggle to create network resources"
}

variable "khulnasoft_volscan_scan_locations" {
  type = list(string)
  default = [
    "eastus",
    "eastus2",
    "southcentralus",
    "westus2",
    "westus3",
    "australiaeast",
    "southeastasia",
    "northeurope",
    "swedencentral",
    "uksouth",
    "westeurope",
    "centralus",
    "southafricanorth",
    "centralindia",
    "eastasia",
    "japaneast",
    "koreacentral",
    "canadacentral",
    "francecentral",
    "germanywestcentral",
    "norwayeast",
    "switzerlandnorth",
    "uaenorth",
    "brazilsouth",
    "qatarcentral",
    "northcentralus",
    "westus",
    "westcentralus",
    "australiacentral",
    "australiasoutheast",
    "japanwest",
    "koreasouth",
    "southindia",
    "westindia",
    "canadaeast",
    "ukwest"
  ]
  description = "List of Azure locations to scan - by default, all regions are selected"
}

variable "khulnasoft_virtual_network_name" {
  type        = string
  default     = "khulnasoft-agentless-scanner"
  description = "KhulnaSoft volume scanning Virtual Network Name"
}

variable "khulnasoft_network_security_group_name" {
  type        = string
  default     = "khulnasoft-agentless-scanner"
  description = "KhulnaSoft volume scanning Network Security Group Name"
}

variable "khulnasoft_subnet_name" {
  type        = string
  default     = "khulnasoft-agentless-scanner"
  description = "KhulnaSoft volume scanning Subnet Name"
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

variable "show_outputs" {
  type        = bool
  default     = false
  description = "Toggle to show summary outputs after deployment"
}

variable "khulnasoft_autoconnect_url" {
  type        = string
  description = "KhulnaSoft AutoConnect URL"
}

variable "khulnasoft_cspm_url" {
  type        = string
  description = "KhulnaSoft CSPM url"
}

variable "khulnasoft_volscan_api_url" {
  type        = string
  description = "KhulnaSoft Event Subscription webhook URL"
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

variable "khulnasoft_configuration_id" {
  type        = string
  description = "KhulnaSoft configuration ID"
}

variable "khulnasoft_cspm_group_id" {
  type        = string
  description = "CSPM group ID"
}
