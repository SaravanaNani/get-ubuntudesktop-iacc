resource "google_service_account" "custom_service_account" {
  account_id   = var.custom_svc_account_id
  display_name = var.custom_svc_display_name
  project      = var.project_id
}

resource "google_project_iam_binding" "service_account_role_bindings" {
  count   = length(var.roles)
  project = var.project_id
  role    = var.roles[count.index]

  members = [
    "serviceAccount:${google_service_account.custom_service_account.email}"
  ]
}
