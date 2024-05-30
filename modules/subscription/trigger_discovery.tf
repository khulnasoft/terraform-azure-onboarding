# NOTE: 
# We use "external" provider here in order to provide the client 
# with the onboarding status if it successfully finished.
data "external" "autoconnect_trigger_discovery" {
  depends_on = [
    module.resource_group,
    module.network,
    module.eventgrid,
  ]

  program = ["python3", "${path.module}/trigger_discovery.py"]

  query = {
    khulnasoft_api_key                     = var.khulnasoft_api_key
    khulnasoft_api_secret                  = var.khulnasoft_api_secret
    khulnasoft_autoconnect_url             = var.khulnasoft_autoconnect_url
    application_id                   = var.application_id
    application_password             = var.application_password
    directory_id                     = var.tenant_id
    organization_id                  = var.management_group_id == "single-subscription" ? "" : var.management_group_id
    subscription_id                  = var.subscription_id
    khulnasoft_cspm_group_id               = var.khulnasoft_cspm_group_id
    khulnasoft_configuration_id            = var.khulnasoft_configuration_id
    is_custom_name_vol_scan          = local.is_custom_name_vol_scan
    khulnasoft_volscan_resource_group_name = var.khulnasoft_volscan_resource_group_name
    khulnasoft_custom_tags                 = join(",", [for key, value in var.khulnasoft_custom_tags : "${key}:${value}"])
  }
}