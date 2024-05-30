variable "khulnasoft_bucket_name" {
  type        = string
  description = "KhulnaSoft Bucket Name"
}

variable "onboarding_type" {
  type        = string
  description = "The type of onboarding"
}

variable "management_group_id" {
  type        = string
  description = "KhulnaSoft Management Group ID"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "principal_id" {
  type        = string
  description = "The ID of the Service Principal to assign the Role Definition to"
}

variable "khulnasoft_volscan_resource_group_name" {
  type        = string
  description = "KhulnaSoft volume scanning Resource Group Name"
}