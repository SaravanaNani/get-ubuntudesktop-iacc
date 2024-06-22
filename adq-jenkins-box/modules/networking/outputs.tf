output "network_self_link" {
  value = google_compute_network.custom_network.self_link
}

output "jenkins_subnetwork_self_link" {
  value = google_compute_subnetwork.jenkins_server.self_link
}
