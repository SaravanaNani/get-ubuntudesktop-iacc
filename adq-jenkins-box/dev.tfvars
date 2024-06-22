project_id = "saravana95"
vpc_name = "custom-vpc-dev"
jenkins_server_subnet_name = "adq-jenkins-box-subnet-dev"
jenkins_server_region = "us-west1"
jenkins_server_cidr = "10.0.1.0/24"
desktop_server_subnet_name = "adq-ubuntudesktop-subnet-dev"
desktop_server_region = "us-west1"
desktop_server_cidr = "10.0.2.0/24"
jenkins_server_firewall_name = "adq-jenkins-box-firewall-dev"
jenkins_server_network_tags = "jenkins-server"
desktop_server_firewall_name = "adq-ubuntudesktop-firewall-dev"
desktop_server_network_tags = "desktop-server"
tomcat_server_firewall_name = "adq-tomcat-firewall-dev"
tomcat_server_network_tags = "tomcat-server"
custom_svc_account_id = "custom-svc-dev"
custom_svc_display_name = "custom-svc-dev"
instance_name = "adq-jenkins-box-dev"
machine_type = "n2-standard-4"
zone = "us-west1-a"
image = "ubuntu-os-cloud/ubuntu-2004-lts"
label_name = "jenkins-server"
server_name_label = "adq-jenkins-box"
env_label = "dev"
app_label = "jenkins-server"
roles = [
  "roles/compute.networkAdmin",
  "roles/compute.securityAdmin",
  "roles/iam.serviceAccountUser",
  "roles/compute.instanceAdmin.v1",
  "roles/storage.admin"
]
