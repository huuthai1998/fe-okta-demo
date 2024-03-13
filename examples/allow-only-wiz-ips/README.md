# Integrate Azure Activity Logs with Wiz Cloud Events

The following Terraform provides an example of integrating Azure Activity Logs with Wiz Cloud Events with access to the Azure Event Hub limited to specific IPs, providing the required connection string as output.

```hcl
provider "azurerm" {
  features {}
}

module "wiz_azure_cloud_events" {
  source = "https://wizio-public.s3.us-east-2.amazonaws.com/deployment-v2/azure/wiz-azure-cloud-events-terraform-module.zip"

  location           = "East US"
  wiz_datacenter_ips = ["1.2.3.4", "5.6.7.8", "9.10.11.12"]
}

output "wiz_azure_cloud_events_connection_string" {
  value = nonsensitive(module.wiz_azure_cloud_events.wiz_cloud_events_eventhub_connection_string)
}
```

**PLEASE NOTE** This will output the sensitive Event Hub connection string to the console. If you wish to mask the output, remove the `nonsensitive()` wrapper, and simply use the `terraform output wiz_azure_cloud_events_connection_string` command to access the connection string.
