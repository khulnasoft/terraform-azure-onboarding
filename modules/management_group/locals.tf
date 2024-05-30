
locals {
  khulnasoft_volscan_template_location                       = var.khulnasoft_volscan_resource_group_location
  autoconnect_agentless_scanner_delete_role_definition = data.http.autoconnect_agentless_scanner_role.response_body
  khulnasoft_agentless_delete_role_name                      = "khulnasoft-agentless-scanner-delete-role-${var.management_group_id}"
  is_custom_name_vol_scan                              = tostring(var.khulnasoft_volscan_resource_group_name != "khulnasoft-agentless-scanner" || var.khulnasoft_event_subscriptions_name != "khulnasoft-agentless-scanner" || var.khulnasoft_system_topics_name != "khulnasoft-agentless-scanner" || var.khulnasoft_subnet_name != "khulnasoft-agentless-scanner")
}