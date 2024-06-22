variable "instance_name" {
  description = "Desktop server instance name"
  type        = string
}

variable "machine_type" {
  description = "The machine type to use for the instance."
  type        = string
}

variable "zone" {
  description = "The zone where the instance will be created."
  type        = string
}

variable "image" {
  description = "The image to use for the instance's boot disk."
  type        = string
}

variable "label_name" {
  description = "Label for the instance."
  type        = string
}

variable "app_label" {
  description = "Label for the application in the VM."
  type        = string
}

variable "server_name_label" {
  description = "Label for the server name."
  type        = string
}

variable "env_label" {
  description = "Label for the environment name."
  type        = string
}

variable "vpc_name" {
  description = "VPC name."
  type        = string
}

variable "desktop_subnet_name" {
  description = "Desktop subnet name."
  type        = string
}
variable "svc_email" {
  description = "svc-email."
  type        = string
}
