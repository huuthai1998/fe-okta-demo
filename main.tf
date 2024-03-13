locals {
  use_existing_resource_group = length(var.resource_group_name) > 0
  resource_group_name         = length(var.resource_group_name) > 0 ? var.resource_group_name : "${var.resource_prefix}-cloud-events-${random_id.uniq.hex}"

  eventhub_name           = length(var.eventhub_name) > 0 ? var.eventhub_name : "${var.resource_prefix}-cloud-events-${random_id.uniq.hex}"
  eventhub_namespace_name = length(var.eventhub_namespace_name) > 0 ? var.eventhub_namespace_name : "${var.resource_prefix}-cloud-events-${random_id.uniq.hex}"

  subscription_ids = var.all_subscriptions ? (
    // the user wants to grant access to all subscriptions
    [for s in data.azurerm_subscriptions.available.subscriptions : s.subscription_id if s.state == "Enabled" && !contains(var.subscription_exclusions, s.subscription_id)]
    ) : (
    // or, if the user wants to grant a list of subscriptions, if none then we default to the primary subscription
    length(var.subscription_ids) > 0 ? var.subscription_ids : [data.azurerm_subscription.primary.subscription_id]
  )
}

data "azurerm_subscription" "primary" {}
data "azurerm_subscriptions" "available" {}

resource "random_id" "uniq" {
  byte_length = 4
}

resource "azurerm_resource_group" "wiz_cloud_events" {
  count = local.use_existing_resource_group ? 0 : 1

  name     = local.resource_group_name
  location = var.location
  tags     = var.tags
}
