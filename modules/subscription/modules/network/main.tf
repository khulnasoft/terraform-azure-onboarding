
resource "azurerm_network_security_group" "khulnasoft_agentless_scanner" {
  for_each            = toset(var.khulnasoft_volscan_scan_locations)
  name                = "${var.khulnasoft_network_security_group_name}-${each.value}"
  location            = each.value
  resource_group_name = var.khulnasoft_volscan_resource_group_name
  tags                = var.tags
}

resource "azurerm_virtual_network" "khulnasoft_agentless_scanner" {
  count               = length(var.khulnasoft_volscan_scan_locations)
  name                = "${var.khulnasoft_virtual_network_name}-${var.khulnasoft_volscan_scan_locations[count.index]}"
  address_space       = local.virtual_network_address_space
  location            = var.khulnasoft_volscan_scan_locations[count.index]
  resource_group_name = var.khulnasoft_volscan_resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "khulnasoft_agentless_scanner" {
  count                = length(var.khulnasoft_volscan_scan_locations)
  name                 = var.khulnasoft_subnet_name
  resource_group_name  = var.khulnasoft_volscan_resource_group_name
  virtual_network_name = azurerm_virtual_network.khulnasoft_agentless_scanner[count.index].name
  address_prefixes     = local.subnet_address_prefixes
}