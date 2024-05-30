output "khulnasoft_volscan_resource_group_name" {
  value       = azurerm_resource_group.khulnasoft_agentless_scanner.name
  description = "KhulnaSoft volume scanning Resource Group Name"
}

output "resource_group_id" {
  value       = azurerm_resource_group.khulnasoft_agentless_scanner.id
  description = "Resource Group ID"
}