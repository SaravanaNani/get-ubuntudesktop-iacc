resource "google_project_service" "dns" {
  project = var.project_id
  service = "dns.googleapis.com"
}

resource "google_compute_network" "custom_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "jenkins_server" {
  name          = var.jenkins_server_subnet_name
  region        = var.jenkins_server_region
  network       = google_compute_network.custom_network.self_link
  ip_cidr_range = var.jenkins_server_cidr
}

resource "google_compute_subnetwork" "desktop_server" {
  name          = var.desktop_server_subnet_name
  region        = var.desktop_server_region
  network       = google_compute_network.custom_network.self_link
  ip_cidr_range = var.desktop_server_cidr
}

resource "google_compute_firewall" "jenkins_server" {
  name    = var.jenkins_server_firewall_name
  network = google_compute_network.custom_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "8080", "32768-60999", "4243"]
  }
  
  allow {
    protocol = "icmp"
  }

  target_tags   = [var.jenkins_server_network_tags]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "desktop_server" {
  name    = var.desktop_server_firewall_name
  network = google_compute_network.custom_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }
  
  allow {
    protocol = "icmp"
  }

  target_tags   = [var.desktop_server_network_tags]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "tomcat_server" {
  name    = var.tomcat_server_firewall_name
  network = google_compute_network.custom_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  
  allow {
    protocol = "icmp"
  }

  target_tags   = [var.tomcat_server_network_tags]
  source_ranges = ["0.0.0.0/0"]
}
