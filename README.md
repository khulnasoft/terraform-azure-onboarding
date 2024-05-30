![Khulnasoft logo](https://avatars3.githubusercontent.com/u/43526139?s=200&v=4)

# Terraform-azure-onboarding
[![Release](https://img.shields.io/github/v/release/khulnasoft/terraform-azure-onboarding)](https://github.com/khulnasoft/terraform-azure-onboarding/releases)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This Terraform module provides an easy way
to configure KhulnaSoft Security’s CSPM and agentless solutions on Azure.

It creates the necessary resources, such as service accounts, roles, and permissions,
to enable seamless integration with KhulnaSoft’s platform.

---

## Table of Contents

- [Pre-requisites](#pre-requisites)
- [Usage](#usage)
- [Examples](#examples)
- [Using Existing Network](#using-existing-network)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Pre-requisites

Before using this module, ensure that you have the following:

- Terraform version `1.6.4` or later.
- `azure` CLI installed and configured.
- `Python` 3+ installed.
- KhulnaSoft Security account API credentials.

## Usage
1. Leverage the KhulnaSoft platform to generate the local variables required by the module.
2. Important: Replace `<khulnasoft_api_key>` and `<khulnasoft_api_secret>` with your generated API credentials.
3. Get from Azure console your Tenant ID. 
4. Run `az login --tenant <tenant_id>` to set your tenant.
5. Only for single subscription --> run `az account set --subscription <subscription_name>` to set azure cli context.
6. Run `terraform init` to initialize the module.
7. Run `terraform apply` to create the resources.

## Examples

Here's an example of how to use this module:

### Single subscription 
```hcl
module "khulnasoft_azure_onboarding" {
  source                               = "khulnasoft/onboarding/azure"
  onboarding_type                      = "single-subscription"
  khulnasoft_bucket_name                     = "khulnasoft-bucket-name"
  khulnasoft_cspm_url                        = "khulnasoft-cspm-url"
  khulnasoft_volscan_api_url                  = "khulnasoft-volscan-api-url"
  khulnasoft_volscan_api_token                = "khulnasoft-volscan-api-token"
  khulnasoft_volscan_resource_group_location = "westus2"
  khulnasoft_volscan_scan_locations          = ["australiaeast", "australiasoutheast"]
  khulnasoft_cspm_group_id                   = "cspm-group-id"
  khulnasoft_configuration_id                 = "khulnasoft-configuration-id"
  khulnasoft_autoconnect_url                  = "khulnasoft-autoconnect-url"
  khulnasoft_api_key                          = "khulnasoft-api-key"
  khulnasoft_api_secret                       = "khulnasoft-api-secret"
  khulnasoft_custom_tags                      = { khulnasoft = "true" }
}
```
---
### Management Group
```hcl
module "khulnasoft_azure_onboarding" {
  source                               = "khulnasoft/onboarding/azure"
  onboarding_type                      = "management-group"
  khulnasoft_bucket_name                     = "khulnasoft-bucket-name"
  management_group_id                  = "management-group-id"
  khulnasoft_cspm_url                        = "khulnasoft-cspm-url"
  khulnasoft_volscan_api_url                 = "khulnasoft-volscan-api-url"
  khulnasoft_volscan_api_token               = "khulnasoft-volscan-api-token"
  khulnasoft_volscan_resource_group_location = "westus2"
  khulnasoft_volscan_scan_locations          = ["australiaeast", "australiasoutheast"]
  khulnasoft_cspm_group_id                   = "cspm-group-id"
  khulnasoft_configuration_id                = "khulnasoft-configuration-id"
  khulnasoft_autoconnect_url                 = "khulnasoft-autoconnect-url"
  khulnasoft_api_key                         = "khulnasoft-api-key"
  khulnasoft_api_secret                      = "khulnasoft-api-secret"
  khulnasoft_custom_tags                     = { khulnasoft = "true" }
}
```
---

## Using Existing Network

If you prefer to use existing networking instead of KhulnaSoft provisioning new ones,
you can do so by setting `create_network = false` in the module's input variables.
In this case, you will need to create the network per subscription,
prior to onboarding, the following resources with the following naming convention:

* Resource group:
  * Name `'khulnasoft-agentless-scanner'`
  * Tag `khulnasoft-agentless-scanner:true`
* Security group (per each chosen scan location):
  * Name `<resource-group-name>-<region>`. E.g., `khulnasoft-agentless-scanner-centralus`
  * Tag `khulnasoft-agentless-scanner:true`
* Virtual network (per each chosen scan location):
  * Name `<resource-group-name>-<region>`. E.g., `khulnasoft-agentless-scanner-centralus`
  * Tag `khulnasoft-agentless-scanner:true`
* Subnet (attached to the virtual network):
  * Name `<resource-group-name>`. E.g., `khulnasoft-agentless-scanner`


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~>2.47.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.95.0 |
| <a name="requirement_external"></a> [external](#requirement\_external) | ~>2.3.3 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~>3.4.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.47.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.95.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application"></a> [application](#module\_application) | ./modules/application | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | ./modules/iam | n/a |
| <a name="module_management_group"></a> [management\_group](#module\_management\_group) | ./modules/management_group | n/a |
| <a name="module_subscription"></a> [subscription](#module\_subscription) | ./modules/subscription | n/a |

## Resources

| Name | Type |
|------|------|
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azurerm_management_group.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/management_group) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_khulnasoft_api_key"></a> [khulnasoft\_api\_key](#input\_khulnasoft\_api\_key) | KhulnaSoft API key | `string` | n/a | yes |
| <a name="input_khulnasoft_api_secret"></a> [khulnasoft\_api\_secret](#input\_khulnasoft\_api\_secret) | KhulnaSoft API secret key | `string` | n/a | yes |
| <a name="input_khulnasoft_autoconnect_url"></a> [khulnasoft\_autoconnect\_url](#input\_khulnasoft\_autoconnect\_url) | KhulnaSoft AutoConnect URL | `string` | n/a | yes |
| <a name="input_khulnasoft_bucket_name"></a> [khulnasoft\_bucket\_name](#input\_khulnasoft\_bucket\_name) | KhulnaSoft Bucket Name | `string` | n/a | yes |
| <a name="input_khulnasoft_configuration_id"></a> [khulnasoft\_configuration\_id](#input\_khulnasoft\_configuration\_id) | KhulnaSoft configuration ID | `string` | n/a | yes |
| <a name="input_khulnasoft_cspm_group_id"></a> [khulnasoft\_cspm\_group\_id](#input\_khulnasoft\_cspm\_group\_id) | CSPM group ID | `string` | n/a | yes |
| <a name="input_khulnasoft_cspm_role_name"></a> [khulnasoft\_cspm\_role\_name](#input\_khulnasoft\_cspm\_role\_name) | KhulnaSoft AutoConnect Scanner Role Name - The default value will be calculated as 'KhulnaSoft\_Auto\_Discovery\_Scanner\_Role\_<subscription\_id>' | `string` | `""` | no |
| <a name="input_khulnasoft_cspm_url"></a> [khulnasoft\_cspm\_url](#input\_khulnasoft\_cspm\_url) | KhulnaSoft CSPM url | `string` | n/a | yes |
| <a name="input_khulnasoft_custom_tags"></a> [khulnasoft\_custom\_tags](#input\_khulnasoft\_custom\_tags) | Client additional resource tags | `map(string)` | `{}` | no |
| <a name="input_khulnasoft_event_subscriptions_name"></a> [khulnasoft\_event\_subscriptions\_name](#input\_khulnasoft\_event\_subscriptions\_name) | KhulnaSoft volume scanning Event Subscriptions Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_network_security_group_name"></a> [khulnasoft\_network\_security\_group\_name](#input\_khulnasoft\_network\_security\_group\_name) | KhulnaSoft volume scanning Network Security Group Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_subnet_name"></a> [khulnasoft\_subnet\_name](#input\_khulnasoft\_subnet\_name) | KhulnaSoft volume scanning Subnet Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_system_topics_name"></a> [khulnasoft\_system\_topics\_name](#input\_khulnasoft\_system\_topics\_name) | KhulnaSoft volume scanning Event Grid System Topic Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_virtual_network_name"></a> [khulnasoft\_virtual\_network\_name](#input\_khulnasoft\_virtual\_network\_name) | KhulnaSoft volume scanning Virtual Network Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_volscan_api_token"></a> [khulnasoft\_volscan\_api\_token](#input\_khulnasoft\_volscan\_api\_token) | KhulnaSoft volume scanning API token | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_api_url"></a> [khulnasoft\_volscan\_api\_url](#input\_khulnasoft\_volscan\_api\_url) | KhulnaSoft Event Subscription webhook URL | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_resource_group_location"></a> [khulnasoft\_volscan\_resource\_group\_location](#input\_khulnasoft\_volscan\_resource\_group\_location) | KhulnaSoft volume scanning Resource Group Location | `string` | `"eastus"` | no |
| <a name="input_khulnasoft_volscan_resource_group_name"></a> [khulnasoft\_volscan\_resource\_group\_name](#input\_khulnasoft\_volscan\_resource\_group\_name) | KhulnaSoft volume scanning Resource Group Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_volscan_scan_locations"></a> [khulnasoft\_volscan\_scan\_locations](#input\_khulnasoft\_volscan\_scan\_locations) | List of Azure locations to scan - by default, all regions are selected | `list(string)` | <pre>[<br>  "eastus",<br>  "eastus2",<br>  "southcentralus",<br>  "westus2",<br>  "westus3",<br>  "australiaeast",<br>  "southeastasia",<br>  "northeurope",<br>  "swedencentral",<br>  "uksouth",<br>  "westeurope",<br>  "centralus",<br>  "southafricanorth",<br>  "centralindia",<br>  "eastasia",<br>  "japaneast",<br>  "koreacentral",<br>  "canadacentral",<br>  "francecentral",<br>  "germanywestcentral",<br>  "norwayeast",<br>  "switzerlandnorth",<br>  "uaenorth",<br>  "brazilsouth",<br>  "qatarcentral",<br>  "northcentralus",<br>  "westus",<br>  "westcentralus",<br>  "australiacentral",<br>  "australiasoutheast",<br>  "japanwest",<br>  "koreasouth",<br>  "southindia",<br>  "westindia",<br>  "canadaeast",<br>  "ukwest"<br>]</pre> | no |
| <a name="input_create_network"></a> [create\_network](#input\_create\_network) | Toggle to create network resources | `bool` | `true` | no |
| <a name="input_management_group_id"></a> [management\_group\_id](#input\_management\_group\_id) | KhulnaSoft Management Group ID - Relevant when onboarding\_type is management-group | `string` | `""` | no |
| <a name="input_onboarding_type"></a> [onboarding\_type](#input\_onboarding\_type) | The type of onboarding. Valid values are 'single-subscription' or 'management-group' onboarding types | `string` | n/a | yes |
| <a name="input_show_outputs"></a> [show\_outputs](#input\_show\_outputs) | Toggle to show summary outputs after deployment | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | Application ID |
| <a name="output_khulnasoft_agentless_scanner_delete_role_definition_id"></a> [khulnasoft\_agentless\_scanner\_delete\_role\_definition\_id](#output\_khulnasoft\_agentless\_scanner\_delete\_role\_definition\_id) | The ID of the created KhulnaSoft agentless delete role definition |
| <a name="output_khulnasoft_agentless_scanner_role_definition_id"></a> [khulnasoft\_agentless\_scanner\_role\_definition\_id](#output\_khulnasoft\_agentless\_scanner\_role\_definition\_id) | The ID of the created KhulnaSoft agentless role definition |
| <a name="output_khulnasoft_cspm_scanner_role_definition_id"></a> [khulnasoft\_cspm\_scanner\_role\_definition\_id](#output\_khulnasoft\_cspm\_scanner\_role\_definition\_id) | The ID of the created KhulnaSoft CSPM role definition |
| <a name="output_khulnasoft_volscan_resource_group_name"></a> [khulnasoft\_volscan\_resource\_group\_name](#output\_khulnasoft\_volscan\_resource\_group\_name) | KhulnaSoft volume scanning Resource Group Name |
| <a name="output_eventgrid_id"></a> [eventgrid\_id](#output\_eventgrid\_id) | EventGrid ID |
| <a name="output_management_group_name"></a> [management\_group\_name](#output\_management\_group\_name) | Management Group name |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | Resource Group ID |
| <a name="output_security_groups_names"></a> [security\_groups\_names](#output\_security\_groups\_names) | Security Groups names |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | Subscription ID |
| <a name="output_virtual_networks_names"></a> [virtual\_networks\_names](#output\_virtual\_networks\_names) | Virtual Networks names |
<!-- END_TF_DOCS -->
