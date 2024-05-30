resource "azurerm_role_definition" "khulnasoft_agentless_scanner_delete" {
  name        = local.khulnasoft_agentless_delete_role_name
  scope       = local.khulnasoft_agentless_delete_role_scope
  description = local.khulnasoft_agentless_delete_role_json["description"]
  permissions {
    actions = local.khulnasoft_agentless_delete_role_json["permissions"][0]["actions"]
  }
  assignable_scopes = [
    local.khulnasoft_agentless_delete_role_scope
  ]
}

resource "azurerm_role_assignment" "khulnasoft_agentless_scanner_delete" {
  scope              = local.khulnasoft_agentless_delete_role_scope
  principal_id       = var.principal_id
  role_definition_id = azurerm_role_definition.khulnasoft_agentless_scanner_delete.role_definition_resource_id
}
