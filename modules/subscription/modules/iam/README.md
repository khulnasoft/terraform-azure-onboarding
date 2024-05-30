# `iam` module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.95.0 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~>3.4.2 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.6.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~>3.95.0 |
| <a name="provider_http"></a> [http](#provider\_http) | ~>3.4.2 |
| <a name="provider_random"></a> [random](#provider\_random) | ~>3.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.khulnasoft_agentless_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.khulnasoft_agentless_scanner_delete](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.khulnasoft_cspm_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.khulnasoft_cspm_scanner_acr_pull_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_definition.khulnasoft_agentless_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [azurerm_role_definition.khulnasoft_agentless_scanner_delete](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [azurerm_role_definition.khulnasoft_cspm_scanner](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [random_string.uuid](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [http_http.autoconnect_agentless_scanner_delete_role](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.autoconnect_agentless_scanner_role](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [http_http.autoconnect_cspm_scanner_role](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_khulnasoft_cspm_role_name"></a> [khulnasoft\_cspm\_role\_name](#input\_khulnasoft\_cspm\_role\_name) | KhulnaSoft Auto Discovery Scanner Role Name | `string` | n/a | yes |
| <a name="input_khulnasoft_management_group_id"></a> [khulnasoft\_management\_group\_id](#input\_khulnasoft\_management\_group\_id) | KhulnaSoft Management Group ID | `string` | n/a | yes |
| <a name="input_khulnasoft_volscan_resource_group_name"></a> [khulnasoft\_volscan\_resource\_group\_name](#input\_khulnasoft\_volscan\_resource\_group\_name) | KhulnaSoft volume scanning Resource Group Name | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment | `string` | n/a | yes |
| <a name="input_principal_id"></a> [principal\_id](#input\_principal\_id) | The ID of the Service Principal to assign the Role Definition to | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription ID | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_khulnasoft_agentless_scanner_delete_role_definition_id"></a> [khulnasoft\_agentless\_scanner\_delete\_role\_definition\_id](#output\_khulnasoft\_agentless\_scanner\_delete\_role\_definition\_id) | The ID of the created KhulnaSoft agentless delete role definition |
| <a name="output_khulnasoft_agentless_scanner_role_definition_id"></a> [khulnasoft\_agentless\_scanner\_role\_definition\_id](#output\_khulnasoft\_agentless\_scanner\_role\_definition\_id) | The ID of the created KhulnaSoft agentless role definition |
| <a name="output_khulnasoft_cspm_scanner_role_definition_id"></a> [khulnasoft\_cspm\_scanner\_role\_definition\_id](#output\_khulnasoft\_cspm\_scanner\_role\_definition\_id) | The ID of the created KhulnaSoft CSPM role definition |
<!-- END_TF_DOCS -->