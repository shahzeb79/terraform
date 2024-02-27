variable "rgname" {
  type        = string
  description = "resource group name"

}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "service_principal_name" {
  type = string
}

variable "keyvault_name" {
  type = string
}
variable "namespaces" {
  description = "List of namespaces to create inside the Kubernetes cluster"
  type        = list(string)
}