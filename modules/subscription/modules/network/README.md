# `network` module

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.95.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.khulnasoft_agentless_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_virtual_network.khulnasoft_agentless_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_subnet.khulnasoft_agentless_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="tags"></a> [tags](#tags) | Client Additional Resource Tags | `string` | n/a | yes |
| <a name="khulnasoft_volscan_scan_locations"></a> [khulnasoft\_volscan\_scan\_locations](#khulnasoft\_volscan\_scan\_locations) | KhulnaSoft list of volume scanning locations | `string` | n/a | yes |
| <a name="khulnasoft_volscan_resource_group_name"></a> [khulnasoft\_volscan\_resource\_group\_name](#khulnasoft\_volscan\_resource\_group\_name) | KhulnaSoft volume scanning Resource Group Name | `string` | n/a | yes |
| <a name="khulnasoft_virtual_network_name"></a> [khulnasoft\_virtual\_network\_name](#khulnasoft\_virtual\_network\_name) | KhulnaSoft volume scanning virtual network name | `string` | n/a | yes |
| <a name="khulnasoft_network_security_group_name"></a> [khulnasoft\_network\_security\_group\_name](#khulnasoft\_network\_security\_group\_name) | KhulnaSoft volume scanning network security group name | `string` | n/a | yes |
| <a name="khulnasoft_subnet_name"></a> [khulnasoft\_subnet\_name](#khulnasoft\_subnet\_name) | KhulnaSoft volume scanning subnet name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="virtual_networks_names"></a> [virtual\_networks\_names](#virtual\_networks\_names) | Virtual Networks list |
| <a name="security_groups_names"></a> [security\_groups\_names](#security\_groups\_names) | Security Groups list |
<!-- END_TF_DOCS -->