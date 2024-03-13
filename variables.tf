variable "all_subscriptions" {
  type        = bool
  description = "A boolean representing whether the module should configure all enabled, non-excluded, subscriptions within the selected Azure tenant. (overrides `subscription_ids`)"
  default     = false
}

variable "enable_entra_id_logging" {
  type        = bool
  description = "A boolean representing whether the module should configure Entra ID log ingestion."
  default     = true
}

variable "eventhub_namespace_name" {
  type        = string
  description = "A string representing the desired Azure Event Hub namespace name."
  default     = ""
}

variable "eventhub_namespace_maximum_throughput_units" {
  type        = number
  description = "A number representing the maximum throughput units for the Azure Event Hub namespace."
  default     = 8
}

variable "eventhub_name" {
  type        = string
  description = "A string representing the desired Azure Event Hub name."
  default     = ""
}

variable "eventhub_partition_count" {
  type        = number
  description = "A number representing the number of shards for the Azure Event Hub."
  default     = 4
}

variable "eventhub_message_retention" {
  type        = number
  description = "A number representing the number of days for which to retain messages on the Azure Event Hub."
  default     = 1
}

variable "location" {
  type        = string
  description = "A string representing the Azure region where resources should be provisioned."
}

variable "resource_group_name" {
  type        = string
  description = "A string representing the Resource Group in which to deploy resources."
  default     = ""
}

variable "resource_prefix" {
  type        = string
  description = "The prefix to use at the beginning of every generated resource."
  default     = "wiz"
}

variable "subscription_exclusions" {
  type        = list(string)
  description = "List of subscriptions to exclude when using the `all_subscriptions` option."
  default     = []
}

variable "subscription_ids" {
  type        = list(string)
  description = "List of subscriptions to enable logging (by default the module will only use the primary subscription)"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A map of strings representing Key/Value pairs of Tags to apply to created resources."
  default     = {}
}

variable "wiz_datacenter_ips" {
  type        = list(string)
  description = "A list of strings representing the 'Cloud Scanner' IPs of your Wiz datacenter."
  default     = []
}
