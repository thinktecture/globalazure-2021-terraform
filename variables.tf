variable "location" {
  type        = string
  default     = "germanywestcentral"
  description = "Where should all resources be generated"
}

variable "custom_tags" {
  type        = map(any)
  default     = {}
  description = "Add some custom tags associated with every resource"
}
