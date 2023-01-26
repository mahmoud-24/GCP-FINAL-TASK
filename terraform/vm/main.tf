resource "google_compute_instance" "private-vm" {
  name         = "private-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  service_account {
    email  = var.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform" ]
  }
  boot_disk {
    initialize_params {
      image = var.image
      size  = 50
    }
  }

  network_interface {
    network    = var.vpc-id
    subnetwork = var.subnet-id
  }
}