resource "azurerm_monitor_diagnostic_setting" "wiz_cloud_events" {
  for_each = toset(local.subscription_ids)

  name               = "${var.resource_prefix}-export-logs-${random_id.uniq.hex}"
  target_resource_id = "/subscriptions/${each.key}"

  eventhub_name                  = local.eventhub_name
  eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.wiz_cloud_events_write.id

  enabled_log {
    category = "Administrative"
  }
  enabled_log {
    category = "Autoscale"
  }
}
