variable "tags" {
  type        = map(string)
  description = "Tags"
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
  description = "KhulnaSoft volume scanning API URL"
}

variable "khulnasoft_volscan_api_token" {
  type        = string
  sensitive   = true
  description = "KhulnaSoft volume scanning API token"
}

variable "khulnasoft_volscan_resource_group_name" {
  type        = string
  description = "KhulnaSoft volume scanning Resource Group Name"
}

variable "resource_group_id" {
  type        = string
  description = "Resource Group ID"
}
