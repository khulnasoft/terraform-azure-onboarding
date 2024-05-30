
output "service_principal_object_id" {
  value       = azuread_service_principal.khulnasoft_cspm_scanner.object_id
  description = "Service principal object ID associated with the application"
}

output "application_id" {
  value       = azuread_service_principal.khulnasoft_cspm_scanner.client_id
  description = "Application ID - represented by the Service principal client ID associated with the application"
}

output "application_password" {
  value       = azuread_application_password.khulnasoft_cspm_scanner.value
  sensitive   = true
  description = "Application password"
}
