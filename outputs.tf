output "subscription_id" {
  value       = var.show_outputs ? (var.onboarding_type == "single-subscription" ? data.azurerm_subscription.current[0].subscription_id : null) : null
  description = "Subscription ID"
}

output "management_group_name" {
  value       = var.show_outputs ? (var.onboarding_type == "management-group" ? data.azurerm_management_group.current[0].display_name : null) : null
  description = "Management Group name"
}

output "application_id" {
  value       = var.show_outputs ? module.application.application_id : null
  description = "Application ID"
}

output "khulnasoft_cspm_scanner_role_definition_id" {
  value       = var.show_outputs ? module.iam.khulnasoft_cspm_scanner_role_definition_id : null
  description = "The ID of the created KhulnaSoft CSPM role definition"
}

output "khulnasoft_agentless_scanner_role_definition_id" {
  value       = var.show_outputs ? module.iam.khulnasoft_agentless_scanner_role_definition_id : null
  description = "The ID of the created KhulnaSoft agentless role definition"
}

output "khulnasoft_agentless_scanner_delete_role_definition_id" {
  value = var.show_outputs ? {
    for subscription_id, subscription_details in module.subscription : subscription_id => subscription_details.khulnasoft_agentless_scanner_delete_role_definition_id
  } : null
  description = "The ID of the created KhulnaSoft agentless delete role definition"
}

output "eventgrid_id" {
  value = var.show_outputs ? (var.onboarding_type == "management-group" ? {
    for subscription_id, subscription_details in module.subscription : subscription_id => subscription_details.eventgrid_id
  } : null) : null
  description = "EventGrid ID"
}

output "khulnasoft_volscan_resource_group_name" {
  value = var.show_outputs ? {
    for subscription_id, subscription_details in module.subscription : subscription_id => subscription_details.khulnasoft_volscan_resource_group_name
  } : null
  description = "KhulnaSoft volume scanning Resource Group Name"
}

output "resource_group_id" {
  value = var.show_outputs ? {
    for subscription_id, subscription_details in module.subscription : subscription_id => subscription_details.resource_group_id
  } : null
  description = "Resource Group ID"
}

output "virtual_networks_names" {
  value = var.show_outputs ? (var.onboarding_type == "management-group" ? {
    for subscription_id, subscription_details in module.subscription : subscription_id => subscription_details.virtual_networks_names
  } : null) : null
  description = "Virtual Networks names"
}

output "security_groups_names" {
  value = var.show_outputs ? (var.onboarding_type == "management-group" ? {
    for subscription_id, subscription_details in module.subscription : subscription_id => subscription_details.security_groups_names
  } : null) : null
  description = "Security Groups names"
}
