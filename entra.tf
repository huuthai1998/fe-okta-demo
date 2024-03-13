resource "azurerm_monitor_aad_diagnostic_setting" "wiz_cloud_events" {
  count = var.enable_entra_id_logging ? 1 : 0

  name = "${var.resource_prefix}-aad-diagnostic-setting-${random_id.uniq.hex}"

  eventhub_name                  = local.eventhub_name
  eventhub_authorization_rule_id = azurerm_eventhub_namespace_authorization_rule.wiz_cloud_events_write.id

  enabled_log {
    category = "AuditLogs"
    retention_policy {}
  }

  enabled_log {
    category = "SignInLogs"
    retention_policy {}
  }

  enabled_log {
    category = "NonInteractiveUserSignInLogs"
    retention_policy {}
  }

  enabled_log {
    category = "ServicePrincipalSignInLogs"
    retention_policy {}
  }

  enabled_log {
    category = "ManagedIdentitySignInLogs"
    retention_policy {}
  }

  enabled_log {
    category = "ProvisioningLogs"
    retention_policy {}
  }

  enabled_log {
    category = "ADFSSignInLogs"
    retention_policy {}
  }

  enabled_log {
    category = "RiskyUsers"
    retention_policy {}
  }

  enabled_log {
    category = "UserRiskEvents"
    retention_policy {}
  }

  enabled_log {
    category = "RiskyServicePrincipals"
    retention_policy {}
  }

  enabled_log {
    category = "ServicePrincipalRiskEvents"
    retention_policy {}
  }
}
