variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "custom_svc_account_id" {
  description = "Custom service account ID"
  type        = string
}

variable "custom_svc_display_name" {
  description = "Custom service account display name"
  type        = string
}

variable "roles" {
  description = "List of roles for the service account"
  type        = list(string)
  default     = [
    "roles/compute.networkAdmin",
    "roles/compute.securityAdmin",
    "roles/iam.serviceAccountUser",
    "roles/compute.instanceAdmin.v1",
    "roles/storage.admin"
  ]
}
