
resource "azurerm_resource_group" "khulnasoft_agentless_scanner" {
  name     = var.khulnasoft_volscan_resource_group_name
  location = var.khulnasoft_volscan_resource_group_location
  tags     = var.resource_group_tags
}