output "eventgrid_id" {
  value       = azurerm_eventgrid_system_topic.khulnasoft_agentless_scanner.id
  description = "EventGrid ID"
}
