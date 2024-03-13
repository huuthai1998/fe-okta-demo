output "wiz_cloud_events_eventhub_name" {
  value = azurerm_eventhub.wiz_cloud_events.name
}

output "wiz_cloud_events_eventhub_connection_string" {
  value = azurerm_eventhub_authorization_rule.wiz_cloud_events_read.primary_connection_string
}

output "wiz_cloud_events_eventhub_write_rule_id" {
  value = azurerm_eventhub_namespace_authorization_rule.wiz_cloud_events_write.id
}
