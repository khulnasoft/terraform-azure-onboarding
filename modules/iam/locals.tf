locals {
  khulnasoft_cspm_role_name  = var.khulnasoft_cspm_role_name == "" ? (var.onboarding_type == "management-group" ? "KhulnaSoft_Auto_Discovery_Scanner_Role_${var.tenant_id}-${var.management_group_id}" : "KhulnaSoft_Auto_Discovery_Scanner_Role_${var.subscription_id}") : var.khulnasoft_cspm_role_name
  khulnasoft_cspm_role_scope = var.onboarding_type == "management-group" ? "/providers/Microsoft.Management/managementGroups/${var.management_group_id}" : "/subscriptions/${var.subscription_id}"
  khulnasoft_cspm_role_json  = jsondecode(data.http.autoconnect_cspm_scanner_role.response_body)
  khulnasoft_cspm_role_management_group_actions_addition = [
    "Microsoft.Management/managementGroups/read",
    "Microsoft.Management/managementGroups/descendants/read",
    "Microsoft.Management/managementGroups/subscriptions/read"
  ]
  khulnasoft_cspm_role_actions = var.onboarding_type == "management-group" ? concat(local.khulnasoft_cspm_role_management_group_actions_addition, local.khulnasoft_cspm_role_json["Actions"]) : local.khulnasoft_cspm_role_json["Actions"]

  khulnasoft_agentless_role_name  = var.onboarding_type == "management-group" ? "khulnasoft-agentless-scanner-${var.tenant_id}-${var.management_group_id}" : "khulnasoft-agentless-scanner-${var.subscription_id}"
  khulnasoft_agentless_role_scope = var.onboarding_type == "management-group" ? "/providers/Microsoft.Management/managementGroups/${var.management_group_id}" : "/subscriptions/${var.subscription_id}"
  khulnasoft_agentless_role_json  = jsondecode(data.http.autoconnect_agentless_scanner_role.response_body)
}

