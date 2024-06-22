module "networking" {
  source = "/root/get-ubuntudesktop-iac/terraform/modules/networking"

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
}

module "service-account" {
  source = "/root/get-ubuntudesktop-iac/terraform/modules/service-account"

  project_id              = var.project_id
  custom_svc_account_id   = var.custom_svc_account_id
  custom_svc_display_name = var.custom_svc_display_name
  roles                   = var.roles
}

resource "google_compute_instance" "jenkins_server" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = 20 # Size in GB
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
    network    = module.networking.network_self_link
    subnetwork = module.networking.jenkins_subnetwork_self_link

    access_config {
      // Ephemeral IP
    }
  }

  labels = {
    jenkins_server = "true"
  }

  service_account {
    email  = module.service-account.svc_email
    scopes = ["cloud-platform"]
  }

  tags = ["jenkins-server"]

  metadata_startup_script = <<-EOF
  #! /bin/bash
  sudo apt-get update
  sudo apt install git -y
  sudo apt install -y openjdk-17-jre wget vim

  # Install Jenkins
  curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt-get update
  sudo apt-get install jenkins -y
  sudo systemctl start jenkins
  sudo systemctl enable jenkins

  # Install Docker
  sudo apt install docker.io -y
  sudo sed -i '14s|.*|ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock|' /lib/systemd/system/docker.service
  sudo systemctl daemon-reload
  sudo systemctl restart docker
  EOF
}
