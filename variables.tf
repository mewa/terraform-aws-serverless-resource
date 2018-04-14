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

variable "methods" {
  type = "list"
  description = "List of resource methods"
}

variable "origin" {
  type = "string"
  description = "Allowed CORS origin"
  default = "*"
}
