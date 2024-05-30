locals {
  khulnasoft_agentless_delete_role_name  = var.onboarding_type == "management-group" ? "khulnasoft-agentless-scanner-delete-role-${var.management_group_id}-${var.subscription_id}" : "khulnasoft-agentless-scanner-delete-role-${var.subscription_id}"
  khulnasoft_agentless_delete_role_scope = "/subscriptions/${var.subscription_id}/resourceGroups/${var.khulnasoft_volscan_resource_group_name}"
  khulnasoft_agentless_delete_role_json  = jsondecode(data.http.autoconnect_agentless_scanner_delete_role.response_body)
}

