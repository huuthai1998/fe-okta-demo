provider "azurerm" {
  features {}
}

module "wiz_azure_cloud_events" {
  source = "../.."

  location          = "East US"
  all_subscriptions = true
  subscription_exclusions = [
    "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  ]
}

output "wiz_azure_cloud_events_connection_string" {
  value = nonsensitive(module.wiz_azure_cloud_events.wiz_cloud_events_eventhub_connection_string)
}
