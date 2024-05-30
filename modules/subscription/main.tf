data "azurerm_resource_group" "resource_group" {
  count = var.create_network ? 0 : 1
  name  = var.khulnasoft_volscan_resource_group_name
}

module "resource_group" {
  source                               = "./modules/resource_group"
  count                                = var.create_network ? 1 : 0
  khulnasoft_volscan_resource_group_name     = var.khulnasoft_volscan_resource_group_name
  khulnasoft_volscan_resource_group_location = var.khulnasoft_volscan_resource_group_location
  resource_group_tags                  = local.tags
}

module "network" {
  source = "./modules/network"
  count  = var.create_network ? 1 : 0

  khulnasoft_virtual_network_name        = var.khulnasoft_virtual_network_name
  khulnasoft_volscan_scan_locations      = var.khulnasoft_volscan_scan_locations
  khulnasoft_volscan_resource_group_name = module.resource_group[0].khulnasoft_volscan_resource_group_name
  tags                             = local.tags

  khulnasoft_network_security_group_name = var.khulnasoft_network_security_group_name

  khulnasoft_subnet_name = var.khulnasoft_subnet_name
  depends_on       = [module.resource_group]
}

module "eventgrid" {
  source = "./modules/eventgrid"
  tags   = local.tags

  khulnasoft_system_topics_name          = var.khulnasoft_system_topics_name
  khulnasoft_event_subscriptions_name    = var.khulnasoft_event_subscriptions_name
  khulnasoft_volscan_api_url             = var.khulnasoft_volscan_api_url
  khulnasoft_volscan_api_token           = var.khulnasoft_volscan_api_token
  khulnasoft_volscan_resource_group_name = var.khulnasoft_volscan_resource_group_name
  resource_group_id                = var.create_network ? module.resource_group[0].resource_group_id : data.azurerm_resource_group.resource_group[0].id
  depends_on = [
    module.resource_group,
    data.azurerm_resource_group.resource_group,
  ]
}

module "iam" {
  source                           = "./modules/iam"
  onboarding_type                  = var.onboarding_type
  khulnasoft_bucket_name                 = var.khulnasoft_bucket_name
  subscription_id                  = var.subscription_id
  khulnasoft_volscan_resource_group_name = var.khulnasoft_volscan_resource_group_name
  principal_id                     = var.principal_id
  management_group_id              = var.management_group_id
  depends_on = [
    module.resource_group,
    data.azurerm_resource_group.resource_group,
  ]
}


