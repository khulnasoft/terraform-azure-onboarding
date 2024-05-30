resource "azurerm_role_definition" "khulnasoft_cspm_scanner" {
  name        = local.khulnasoft_cspm_role_name
  scope       = local.khulnasoft_cspm_role_scope
  description = local.khulnasoft_cspm_role_json["Description"]
  permissions {
    actions          = local.khulnasoft_cspm_role_actions
    not_actions      = local.khulnasoft_cspm_role_json["NotActions"]
    data_actions     = local.khulnasoft_cspm_role_json["DataActions"]
    not_data_actions = local.khulnasoft_cspm_role_json["NotDataActions"]
  }
  assignable_scopes = [local.khulnasoft_cspm_role_scope]
}

resource "azurerm_role_assignment" "khulnasoft_cspm_scanner" {
  scope              = local.khulnasoft_cspm_role_scope
  principal_id       = var.principal_id
  role_definition_id = azurerm_role_definition.khulnasoft_cspm_scanner.role_definition_resource_id
}


resource "azurerm_role_assignment" "khulnasoft_cspm_scanner_acr_pull_role" {
  scope                = local.khulnasoft_cspm_role_scope
  principal_id         = var.principal_id
  role_definition_name = "AcrPull"
}

resource "azurerm_role_definition" "khulnasoft_agentless_scanner" {
  name        = local.khulnasoft_agentless_role_name
  scope       = local.khulnasoft_agentless_role_scope
  description = local.khulnasoft_agentless_role_json["Description"]
  permissions {
    actions          = local.khulnasoft_agentless_role_json["Actions"]
    not_actions      = local.khulnasoft_agentless_role_json["NotActions"]
    data_actions     = local.khulnasoft_agentless_role_json["DataActions"]
    not_data_actions = local.khulnasoft_agentless_role_json["NotDataActions"]
  }
  assignable_scopes = [
    local.khulnasoft_agentless_role_scope
  ]
}

resource "azurerm_role_assignment" "khulnasoft_agentless_scanner" {
  scope              = local.khulnasoft_agentless_role_scope
  principal_id       = var.principal_id
  role_definition_id = azurerm_role_definition.khulnasoft_agentless_scanner.role_definition_resource_id
}