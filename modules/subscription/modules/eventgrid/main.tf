
resource "azurerm_eventgrid_system_topic" "khulnasoft_agentless_scanner" {
  name                   = var.khulnasoft_system_topics_name
  location               = "global"
  resource_group_name    = var.khulnasoft_volscan_resource_group_name
  source_arm_resource_id = var.resource_group_id
  topic_type             = "Microsoft.Resources.ResourceGroups"
  tags                   = var.tags
}


resource "azurerm_eventgrid_event_subscription" "khulnasoft_agentless_scanner" {
  name                  = var.khulnasoft_event_subscriptions_name
  scope                 = var.resource_group_id
  event_delivery_schema = "EventGridSchema"

  advanced_filtering_on_arrays_enabled = true

  included_event_types = [
    "Microsoft.Resources.ResourceWriteSuccess",
    "Microsoft.Resources.ResourceDeleteSuccess",
  ]

  webhook_endpoint {
    url                               = var.khulnasoft_volscan_api_url
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
  }

  delivery_property {
    header_name = "x-vs-api-key"
    type        = "Static"
    value       = var.khulnasoft_volscan_api_token
    secret      = true
  }

  subject_filter {
    subject_ends_with = "-aas"
  }
}