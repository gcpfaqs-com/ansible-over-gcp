resource "google_compute_network" "ansible_vpc" {
  name                    = "ansible-lab-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "ansible_subnet" {
  name          = "ansible-lab-subnet-us-central1"
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.ansible_vpc.id
}

resource "google_compute_firewall" "lab_access" {
  name    = "ansible-lab-allow-mgmt"
  network = google_compute_network.ansible_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "5985", "5986"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ansible-lab"]
}