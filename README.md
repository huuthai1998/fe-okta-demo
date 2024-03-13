<!-- BEGIN_TF_DOCS -->
# wiz-azure-cloud-events-terraform-module

A Terraform module to integrate Azure Activity Logs with Wiz.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.7 |
| azurerm | ~> 3.71 |
| random | >= 2.1 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 3.71 |
| random | >= 2.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_eventhub.wiz_cloud_events](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub) | resource |
| [azurerm_eventhub_authorization_rule.wiz_cloud_events_read](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_authorization_rule) | resource |
| [azurerm_eventhub_namespace.wiz_cloud_events](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace) | resource |
| [azurerm_eventhub_namespace_authorization_rule.wiz_cloud_events_write](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventhub_namespace_authorization_rule) | resource |
| [azurerm_monitor_aad_diagnostic_setting.wiz_cloud_events](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_aad_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.wiz_cloud_events](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_resource_group.wiz_cloud_events](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [random_id.uniq](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [azurerm_subscription.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
| [azurerm_subscriptions.available](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | A string representing the Azure region where resources should be provisioned. | `string` | n/a | yes |
| all\_subscriptions | A boolean representing whether the module should configure all enabled, non-excluded, subscriptions within the selected Azure tenant. (overrides `subscription_ids`) | `bool` | `false` | no |
| enable\_entra\_id\_logging | A boolean representing whether the module should configure Entra ID log ingestion. | `bool` | `true` | no |
| eventhub\_message\_retention | A number representing the number of days for which to retain messages on the Azure Event Hub. | `number` | `1` | no |
| eventhub\_name | A string representing the desired Azure Event Hub name. | `string` | `""` | no |
| eventhub\_namespace\_maximum\_throughput\_units | A number representing the maximum throughput units for the Azure Event Hub namespace. | `number` | `8` | no |
| eventhub\_namespace\_name | A string representing the desired Azure Event Hub namespace name. | `string` | `""` | no |
| eventhub\_partition\_count | A number representing the number of shards for the Azure Event Hub. | `number` | `4` | no |
| resource\_group\_name | A string representing the Resource Group in which to deploy resources. | `string` | `""` | no |
| resource\_prefix | The prefix to use at the beginning of every generated resource. | `string` | `"wiz"` | no |
| subscription\_exclusions | List of subscriptions to exclude when using the `all_subscriptions` option. | `list(string)` | `[]` | no |
| subscription\_ids | List of subscriptions to enable logging (by default the module will only use the primary subscription) | `list(string)` | `[]` | no |
| tags | A map of strings representing Key/Value pairs of Tags to apply to created resources. | `map(string)` | `{}` | no |
| wiz\_datacenter\_ips | A list of strings representing the 'Cloud Scanner' IPs of your Wiz datacenter. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| wiz\_cloud\_events\_eventhub\_connection\_string | n/a |
| wiz\_cloud\_events\_eventhub\_name | n/a |
| wiz\_cloud\_events\_eventhub\_write\_rule\_id | n/a |
<!-- END_TF_DOCS -->