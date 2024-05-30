
module "application" {
  source           = "./modules/application"
  application_name = local.application_name
}

module "iam" {
  source              = "./modules/iam"
  onboarding_type     = var.onboarding_type
  khulnasoft_bucket_name    = var.khulnasoft_bucket_name
  khulnasoft_cspm_role_name = var.khulnasoft_cspm_role_name
  principal_id        = module.application.service_principal_object_id
  subscription_id     = local.subscription_id
  management_group_id = var.management_group_id
  tenant_id           = local.tenant_id
  depends_on          = [module.application]
}

module "management_group" {
  source                               = "./modules/management_group"
  count                                = var.onboarding_type == "management-group" ? 1 : 0
  application_id                       = module.application.application_id
  application_password                 = module.application.application_password
  khulnasoft_api_key                         = var.khulnasoft_api_key
  khulnasoft_api_secret                      = var.khulnasoft_api_secret
  khulnasoft_autoconnect_url                 = var.khulnasoft_autoconnect_url
  khulnasoft_bucket_name                     = var.khulnasoft_bucket_name
  khulnasoft_configuration_id                = var.khulnasoft_configuration_id
  khulnasoft_cspm_group_id                   = var.khulnasoft_cspm_group_id
  khulnasoft_cspm_url                        = var.khulnasoft_cspm_url
  khulnasoft_custom_tags                     = var.khulnasoft_custom_tags
  management_group_id                  = var.management_group_id
  khulnasoft_network_security_group_name     = var.khulnasoft_network_security_group_name
  khulnasoft_volscan_resource_group_location = var.khulnasoft_volscan_resource_group_location
  khulnasoft_virtual_network_name            = var.khulnasoft_virtual_network_name
  khulnasoft_volscan_api_token               = var.khulnasoft_volscan_api_token
  khulnasoft_volscan_api_url                 = var.khulnasoft_volscan_api_url
  khulnasoft_volscan_scan_locations          = var.khulnasoft_volscan_scan_locations
  service_principal_id                 = module.application.service_principal_object_id
  subscription_ids                     = local.subscription_ids
  depends_on                           = [module.iam]
}

module "subscription" {
  source                               = "./modules/subscription"
  count                                = var.onboarding_type == "single-subscription" ? 1 : 0
  khulnasoft_bucket_name                     = var.khulnasoft_bucket_name
  onboarding_type                      = var.onboarding_type
  principal_id                         = module.application.service_principal_object_id
  subscription_id                      = data.azurerm_subscription.current[0].subscription_id
  management_group_id                  = var.management_group_id
  tenant_id                            = local.tenant_id
  application_id                       = module.application.application_id
  application_password                 = module.application.application_password
  khulnasoft_volscan_resource_group_name     = var.khulnasoft_volscan_resource_group_name
  khulnasoft_volscan_resource_group_location = var.khulnasoft_volscan_resource_group_location
  khulnasoft_autoconnect_url                 = var.khulnasoft_autoconnect_url
  khulnasoft_volscan_api_url                 = var.khulnasoft_volscan_api_url
  khulnasoft_volscan_api_token               = var.khulnasoft_volscan_api_token
  khulnasoft_api_key                         = var.khulnasoft_api_key
  khulnasoft_api_secret                      = var.khulnasoft_api_secret
  khulnasoft_configuration_id                = var.khulnasoft_configuration_id
  khulnasoft_cspm_group_id                   = var.khulnasoft_cspm_group_id
  khulnasoft_volscan_scan_locations          = var.khulnasoft_volscan_scan_locations
  khulnasoft_virtual_network_name            = var.khulnasoft_virtual_network_name
  khulnasoft_subnet_name                     = var.khulnasoft_subnet_name
  khulnasoft_network_security_group_name     = var.khulnasoft_network_security_group_name
  khulnasoft_system_topics_name              = var.khulnasoft_system_topics_name
  khulnasoft_event_subscriptions_name        = var.khulnasoft_event_subscriptions_name
  khulnasoft_custom_tags                     = var.khulnasoft_custom_tags
  create_network                       = var.create_network
  depends_on                           = [module.iam]
}
