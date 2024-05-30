
output "khulnasoft_cspm_scanner_role_definition_id" {
  value       = azurerm_role_definition.khulnasoft_cspm_scanner.role_definition_id
  description = "The ID of the created KhulnaSoft CSPM role definition"
}

output "khulnasoft_agentless_scanner_role_definition_id" {
  value       = azurerm_role_definition.khulnasoft_agentless_scanner.role_definition_id
  description = "The ID of the created KhulnaSoft agentless role definition"
}