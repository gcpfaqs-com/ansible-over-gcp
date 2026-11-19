locals {
  linux_images = {
    debian = "projects/debian-cloud/global/images/family/debian-12"
    ubuntu = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2404-lts-amd64"
    rocky  = "projects/rocky-linux-cloud/global/images/family/rocky-linux-9"
    rhel   = "projects/rhel-cloud/global/images/family/rhel-9"
  }

  ssh_public_key = trimspace(file(pathexpand(var.ssh_public_key_path)))
}

resource "google_compute_instance" "linux_vms" {
  for_each     = local.linux_images
  name         = "lab-${each.key}"
  machine_type = "e2-small"
  zone         = var.zone
  tags         = ["ansible-lab"]

  boot_disk {
    initialize_params {
      image = each.value
      size  = 20
    }
  }

  network_interface {
    network    = google_compute_network.ansible_vpc.id
    subnetwork = google_compute_subnetwork.ansible_subnet.id
    access_config {}
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${local.ssh_public_key}"
  }

  depends_on = [google_compute_subnetwork.ansible_subnet]
}