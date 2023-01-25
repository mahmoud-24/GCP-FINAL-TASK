resource "google_compute_instance" "private-vm" {
  name         = "private-vm"
  machine_type = var.machine_type
  zone         = "us-central1-c"
  boot_disk {
    initialize_params {
      image = var.machine_image
    }
  }

  network_interface {
    network    = module.network.network_name
    subnetwork = module.network.management-subnet_name
  }
}