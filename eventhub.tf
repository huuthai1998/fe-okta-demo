resource "azurerm_eventhub_namespace" "wiz_cloud_events" {
  name                = local.eventhub_namespace_name
  resource_group_name = local.resource_group_name
  location            = var.location

  sku                      = "Standard"
  capacity                 = 1
  auto_inflate_enabled     = true
  maximum_throughput_units = var.eventhub_namespace_maximum_throughput_units

  dynamic "network_rulesets" {
    // This is a weird thing in Terraform, but allows this to work properly
    for_each = length(var.wiz_datacenter_ips) > 0 ? [1] : [1]

    content {
      default_action                 = length(var.wiz_datacenter_ips) > 0 ? "Deny" : "Allow"
      trusted_service_access_enabled = true

      dynamic "ip_rule" {
        for_each = toset(var.wiz_datacenter_ips)

        content {
          ip_mask = ip_rule.value
        }
      }
    }
  }

  tags = var.tags

  depends_on = [
    azurerm_resource_group.wiz_cloud_events
  ]
}

resource "azurerm_eventhub" "wiz_cloud_events" {
  name                = local.eventhub_name
  namespace_name      = azurerm_eventhub_namespace.wiz_cloud_events.name
  resource_group_name = azurerm_eventhub_namespace.wiz_cloud_events.resource_group_name

  partition_count   = var.eventhub_partition_count
  message_retention = var.eventhub_message_retention
}

resource "azurerm_eventhub_namespace_authorization_rule" "wiz_cloud_events_write" {
  name                = "logsWriter"
  namespace_name      = azurerm_eventhub_namespace.wiz_cloud_events.name
  resource_group_name = azurerm_eventhub_namespace.wiz_cloud_events.resource_group_name

  listen = false
  send   = true
  manage = false
}

resource "azurerm_eventhub_authorization_rule" "wiz_cloud_events_read" {
  name                = "logsReader"
  eventhub_name       = azurerm_eventhub.wiz_cloud_events.name
  namespace_name      = azurerm_eventhub_namespace.wiz_cloud_events.name
  resource_group_name = azurerm_eventhub_namespace.wiz_cloud_events.resource_group_name

  listen = true
  send   = false
  manage = false
}
