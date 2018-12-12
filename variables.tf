variable "api" {
  type = "string"
  description = "REST API id"
}

variable "root_resource" {
  type = "string"
  description = "Root resource id of supplied REST API"
}

variable "resource" {
  type = "string"
  description = "Resource name"
}

variable "api_key_required" {
  default = "false"
}

variable "methods" {
  type = "list"
  description = "List of resource methods"
}

variable "num_methods" {
  type = "string"
  description = "Number of methods"
}

variable "origin" {
  type = "string"
  description = "Allowed CORS origin"
  default = "*"
}
