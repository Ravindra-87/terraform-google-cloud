provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
  credentials = file(var.credentials_file)
}

resource "google_compute_instance" "jenkins" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  allow_stopping_for_update = true  # Allows stopping for updates like machine_type changes


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network       = "default"
    access_config {}
  }

  tags = ["jenkins"]

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}

resource "google_compute_firewall" "jenkins-firewall" {
  name    = "allow-jenkins"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["jenkins"]
}
