
resource "azurerm_management_group_template_deployment" "management_group_deployment" {
  name                = "khulnasoft-agentless-scanner"
  location            = local.khulnasoft_volscan_template_location
  management_group_id = "/providers/Microsoft.Management/managementGroups/${var.management_group_id}"
  template_content    = data.http.autoconnect_agentless_deployment_management_group_template.response_body
  parameters_content = jsonencode({
    "subscriptionIds" : {
      "value" = var.subscription_ids
    },
    "resourceGroupLocation" = {
      "value" = local.khulnasoft_volscan_template_location
    },
    "scanLocations" = {
      "value" = var.khulnasoft_volscan_scan_locations
    },
    "eventIngesterURL" = {
      "value" = var.khulnasoft_volscan_api_url
    },
    "eventIngesterToken" = {
      "value" = var.khulnasoft_volscan_api_token
    },
    "additionalResourceTags" = {
      "value" = var.khulnasoft_custom_tags
    },
    "autoconnectURL" = {
      "value" = var.khulnasoft_autoconnect_url
    },
    "cspmAPIURL" = {
      "value" = var.khulnasoft_cspm_url
    },
    "apiKey" = {
      "value" = var.khulnasoft_api_key
    },
    "apiSecret" = {
      "value" = var.khulnasoft_api_secret
    },
    "cspmGroupId" = {
      "value" = var.khulnasoft_cspm_group_id
    },
    "configurationId" = {
      "value" = var.khulnasoft_configuration_id
    },
    "applicationId" = {
      "value" = var.application_id
    },
    "applicationPassword" = {
      "value" = var.application_password
    },
    "postInstallResourceTags" : {
      "value" = join(",", [for key, value in var.khulnasoft_custom_tags : "${key}:${value}"])
    },
    "servicePrincipalId" = {
      "value" = var.service_principal_id
    },
    "khulnasoftDeleteRoleDefinition" = {
      "value" = local.autoconnect_agentless_scanner_delete_role_definition
    },
    "khulnasoftDeleteRoleName" = {
      "value" = local.khulnasoft_agentless_delete_role_name
    },
    "resourceGroupName" = {
      "value" = var.khulnasoft_volscan_resource_group_name
    },
    "systemTopicsName" = {
      "value" = var.khulnasoft_system_topics_name
    },
    "eventSubscriptionsName" = {
      "value" = var.khulnasoft_event_subscriptions_name
    },
    "networkSecurityGroupsNames" = {
      "value" = [for location in var.khulnasoft_volscan_scan_locations :
        "${var.khulnasoft_network_security_group_name}-${location}"
      ]
    },
    "virtualNetworkNames" = {
      "value" : [for location in var.khulnasoft_volscan_scan_locations :
        "${var.khulnasoft_virtual_network_name}-${location}"
      ]
    },
    "subnetsName" = {
      "value" = var.khulnasoft_subnet_name
    },
    "resourceGroupNameVolScan" = {
      "value" = var.khulnasoft_volscan_resource_group_name
    },
    "isCustomNameVolScan" = {
      "value" = local.is_custom_name_vol_scan
    }
  })
}

