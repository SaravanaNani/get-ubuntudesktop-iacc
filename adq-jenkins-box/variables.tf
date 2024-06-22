variable "project_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone" {
  type = string
}

variable "image" {
  type = string
}

variable "label_name" {
  description = "The label is created for server-label."
  type        = string
}

variable "app_label" {
  description = "The label is created for application in the VM."
  type        = string
}

variable "server_name_label" {
  description = "The label is created for server-name."
  type        = string
}

variable "env_label" {
  description = "The label is created for environment-name."
  type        = string
}

variable "vpc_name" {
  type = string
}

variable "jenkins_server_subnet_name" {
  type = string
}

variable "jenkins_server_region" {
  type = string
}

variable "jenkins_server_cidr" {
  type = string
}

variable "desktop_server_subnet_name" {
  type = string
}

variable "desktop_server_region" {
  type = string
}

variable "desktop_server_cidr" {
  type = string
}

variable "jenkins_server_firewall_name" {
  type = string
}

variable "jenkins_server_network_tags" {
  type = string
}

variable "desktop_server_firewall_name" {
  type = string
}

variable "desktop_server_network_tags" {
  type = string
}

variable "tomcat_server_firewall_name" {
  type = string
}

variable "tomcat_server_network_tags" {
  type = string
}

variable "custom_svc_account_id" {
  description = "custom-svc-account-id"
  type = string
}

variable "custom_svc_display_name" {
  description = "custom-svc-display-name"
  type = string
}

variable "roles" {
  description = "List of roles to be assigned to the service account"
  type = list(string)
}
