# `management_group` module

---

This Terraform module creates the Management Group resources - on Azure.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~>2.47.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.95.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~>3.4.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.95.0 |
| <a name="provider_http"></a> [http](#provider\_http) | ~>3.4.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_management_group_template_deployment.management_group_deployment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_template_deployment) | resource |
| [http_http.autoconnect_agentless_deployment_management_group_template](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.autoconnect_agentless_scanner_role](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | Application ID - represented by the Service principal client ID associated with the application | `string` | n/a | yes |
| <a name="input_application_password"></a> [application\_password](#input\_application\_password) | Application password | `string` | n/a | yes |
| <a name="input_khulnasoft_api_key"></a> [khulnasoft\_api\_key](#input\_khulnasoft\_api\_key) | KhulnaSoft API key | `string` | n/a | yes |
| <a name="input_khulnasoft_api_secret"></a> [khulnasoft\_api\_secret](#input\_khulnasoft\_api\_secret) | KhulnaSoft API secret key | `string` | n/a | yes |
| <a name="input_khulnasoft_autoconnect_url"></a> [khulnasoft\_autoconnect\_url](#input\_khulnasoft\_autoconnect\_url) | KhulnaSoft AutoConnect URL | `string` | n/a | yes |
| <a name="input_khulnasoft_bucket_name"></a> [khulnasoft\_bucket\_name](#input\_khulnasoft\_bucket\_name) | KhulnaSoft Bucket Name | `string` | n/a | yes |
| <a name="input_khulnasoft_configuration_id"></a> [khulnasoft\_configuration\_id](#input\_khulnasoft\_configuration\_id) | KhulnaSoft configuration id | `string` | n/a | yes |
| <a name="input_khulnasoft_cspm_group_id"></a> [khulnasoft\_cspm\_group\_id](#input\_khulnasoft\_cspm\_group\_id) | KhulnaSoft CSPM group ID | `string` | n/a | yes |
| <a name="input_khulnasoft_cspm_url"></a> [khulnasoft\_cspm\_url](#input\_khulnasoft\_cspm\_url) | KhulnaSoft CSPM group url | `string` | n/a | yes |
| <a name="input_khulnasoft_custom_tags"></a> [khulnasoft\_custom\_tags](#input\_khulnasoft\_custom\_tags) | KhulnaSoft Client Additional Resource Tags | `map(string)` | n/a | yes |
| <a name="input_khulnasoft_event_subscriptions_name"></a> [khulnasoft\_event\_subscriptions\_name](#input\_khulnasoft\_event\_subscriptions\_name) | KhulnaSoft volume scanning Event Subscriptions Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_network_security_group_name"></a> [khulnasoft\_network\_security\_group\_name](#input\_khulnasoft\_network\_security\_group\_name) | KhulnaSoft volume scanning Network Security Group Name | `string` | n/a | yes |
| <a name="input_khulnasoft_subnet_name"></a> [khulnasoft\_subnet\_name](#input\_khulnasoft\_subnet\_name) | KhulnaSoft volume scanning Subnet Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_system_topics_name"></a> [khulnasoft\_system\_topics\_name](#input\_khulnasoft\_system\_topics\_name) | KhulnaSoft volume scanning Event Grid System Topic Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_virtual_network_name"></a> [khulnasoft\_virtual\_network\_name](#input\_khulnasoft\_virtual\_network\_name) | KhulnaSoft volume scanning Virtual Network Name | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_api_token"></a> [khulnasoft\_volscan\_api\_token](#input\_khulnasoft\_volscan\_api\_token) | KhulnaSoft volume scanning API token | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_api_url"></a> [khulnasoft\_volscan\_api\_url](#input\_khulnasoft\_volscan\_api\_url) | KhulnaSoft volume scan API URL | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_resource_group_location"></a> [khulnasoft\_volscan\_resource\_group\_location](#input\_khulnasoft\_volscan\_resource\_group\_location) | KhulnaSoft volume scanning Resource Group Location | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_resource_group_name"></a> [khulnasoft\_volscan\_resource\_group\_name](#input\_khulnasoft\_volscan\_resource\_group\_name) | KhulnaSoft volume scanning Resource Group Name | `string` | `"khulnasoft-agentless-scanner"` | no |
| <a name="input_khulnasoft_volscan_scan_locations"></a> [khulnasoft\_volscan\_scan\_locations](#input\_khulnasoft\_volscan\_scan\_locations) | List of Azure locations to scan | `list(string)` | n/a | yes |
| <a name="input_management_group_id"></a> [management\_group\_id](#input\_management\_group\_id) | Management Group ID - Relevant when onboarding\_type is management-group | `string` | n/a | yes |
| <a name="input_service_principal_id"></a> [service\_principal\_id](#input\_service\_principal\_id) | The ID of the Service Principal to assign the Role Definition to | `string` | n/a | yes |
| <a name="input_subscription_ids"></a> [subscription\_ids](#input\_subscription\_ids) | List of the Management Group subscriptions | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->