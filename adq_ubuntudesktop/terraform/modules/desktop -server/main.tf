resource "google_compute_instance" "desktop-server" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      labels = {
        label            = var.label_name
        server_name      = var.server_name_label
        environment_label = var.env_label
        application_label = var.app_label
      }
    }
  }

  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network    = var.vpc_name
    subnetwork = var.desktop_subnet_name

    access_config {
      // Ephemeral IP
    }
  }

  labels = {
    desktop_server = "true"
  }

  service_account {
    email  = var.svc_email
    scopes = ["cloud-platform"]
  }

}
