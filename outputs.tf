output "jenkins_url" {
  value = "http://${google_compute_instance.jenkins.network_interface[0].access_config[0].nat_ip}"
}

output "service_account_used" {
  value = var.service_account_email
}
