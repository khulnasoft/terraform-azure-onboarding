# `eventgrid` module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.95.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.95.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventgrid_event_subscription.khulnasoft_agentless_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_event_subscription) | resource |
| [azurerm_eventgrid_system_topic.khulnasoft_agentless_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_khulnasoft_event_subscriptions_name"></a> [khulnasoft\_event\_subscriptions\_name](#input\_khulnasoft\_event\_subscriptions\_name) | KhulnaSoft Event Subscriptions Name | `string` | n/a | yes |
| <a name="input_khulnasoft_system_topics_name"></a> [khulnasoft\_system\_topics\_name](#input\_khulnasoft\_system\_topics\_name) | KhulnaSoft Event Grid System Topics | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_api_token"></a> [khulnasoft\_volscan\_api\_token](#input\_khulnasoft\_volscan\_api\_token) | KhulnaSoft volume scanning API token | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_api_url"></a> [khulnasoft\_volscan\_api\_url](#input\_khulnasoft\_volscan\_api\_url) | KhulnaSoft volume scanning API URL | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_resource_group_name"></a> [khulnasoft\_volscan\_resource\_group\_name](#input\_khulnasoft\_volscan\_resource\_group\_name) | KhulnaSoft volume scanning Resource Group Name | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource Group ID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventgrid_id"></a> [eventgrid\_id](#output\_eventgrid\_id) | EventGrid ID |
<!-- END_TF_DOCS -->
