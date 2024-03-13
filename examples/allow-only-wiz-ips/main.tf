provider "azurerm" {
  features {}
}

module "wiz_azure_cloud_events" {
  source = "../.."

  location           = "East US"
  wiz_datacenter_ips = ["1.2.3.4", "5.6.7.8", "9.10.11.12"]
}

output "wiz_azure_cloud_events_connection_string" {
  value = nonsensitive(module.wiz_azure_cloud_events.wiz_cloud_events_eventhub_connection_string)
}
