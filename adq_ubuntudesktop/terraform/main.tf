provider "google" {
  project = "saravana95"
}

terraform {
  backend "gcs" {
    bucket = "saravana-desk-state-backup-bucket"
    prefix = "terraform-desktop/state"
  }
}

module "desktop-server" {
  source = "/root/get-ubuntudesktop-iac/terraform-desktop/modules/desktop-server"

  instance_name     = var.instance_name
  machine_type      = var.machine_type
  zone              = var.zone
  image             = var.image
  label_name        = var.label_name
  app_label         = var.app_label
  server_name_label = var.server_name_label
  env_label         = var.env_label
  vpc_name          = var.vpc_name
  desktop_subnet_name = var.desktop_subnet_name
  svc_email         = var.svc_email
}
