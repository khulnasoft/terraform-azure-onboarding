locals {
  tags                    = merge({ "khulnasoft-agentless-scanner" = "true" }, var.khulnasoft_custom_tags)
  is_custom_name_vol_scan = var.khulnasoft_volscan_resource_group_name != "khulnasoft-agentless-scanner" || var.khulnasoft_event_subscriptions_name != "khulnasoft-agentless-scanner" || var.khulnasoft_system_topics_name != "khulnasoft-agentless-scanner" || var.khulnasoft_subnet_name != "khulnasoft-agentless-scanner" || var.khulnasoft_virtual_network_name != "khulnasoft-agentless-scanner" || var.khulnasoft_network_security_group_name != "khulnasoft-agentless-scanner"
}
