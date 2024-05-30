resource "azuread_application" "khulnasoft_cspm_scanner" {
  display_name = var.application_name
}

resource "azuread_application_password" "khulnasoft_cspm_scanner" {
  display_name      = "rbac"
  application_id    = "/applications/${azuread_application.khulnasoft_cspm_scanner.object_id}"
  end_date_relative = "262980h"
}

resource "azuread_service_principal" "khulnasoft_cspm_scanner" {
  client_id = azuread_application.khulnasoft_cspm_scanner.client_id
}