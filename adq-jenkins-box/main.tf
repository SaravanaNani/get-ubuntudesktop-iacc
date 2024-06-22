provider "google" {
  project     = "saravana95"
}

terraform {
  backend "gcs" {
    bucket  = "saravana-desk-state-backup-bucket"
    prefix  = "terraform-infra/state"
  }
}

module "jenkins-server" {
  source = "/root/get-ubuntudesktop-iac/terraform/modules/jenkins-server"

  instance_name        = var.instance_name
  machine_type         = var.machine_type
  zone                 = var.zone
  image                = var.image
  label_name           = var.label_name
  app_label            = var.app_label
  server_name_label    = var.server_name_label
  env_label            = var.env_label

  project_id                   = var.project_id
  vpc_name                     = var.vpc_name
  jenkins_server_subnet_name   = var.jenkins_server_subnet_name
  jenkins_server_region        = var.jenkins_server_region
  jenkins_server_cidr          = var.jenkins_server_cidr
  desktop_server_subnet_name   = var.desktop_server_subnet_name
  desktop_server_region        = var.desktop_server_region
  desktop_server_cidr          = var.desktop_server_cidr
  jenkins_server_firewall_name = var.jenkins_server_firewall_name
  jenkins_server_network_tags  = var.jenkins_server_network_tags
  desktop_server_firewall_name = var.desktop_server_firewall_name
  desktop_server_network_tags  = var.desktop_server_network_tags
  tomcat_server_firewall_name  = var.tomcat_server_firewall_name
  tomcat_server_network_tags   = var.tomcat_server_network_tags

  custom_svc_account_id   = var.custom_svc_account_id
  custom_svc_display_name = var.custom_svc_display_name
  roles                   = var.roles
}
