variable "location" {

}
 variable "resource_group_name" {}

variable "service_principal_name" {
  type = string
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "client_id" {}
variable "client_secret" {
  type = string
  sensitive = true
}
variable "namespaces" {
  description = "List of namespaces to create inside the Kubernetes cluster"
  type        = list(string)
}