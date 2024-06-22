variable "project_id" {
  type = string
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
