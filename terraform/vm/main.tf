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
/*
  depends_on = [
    google_container_cluster.private-cluster
   , google_container_node_pool.private-cluster_node_pool
  ]
  metadata_startup_script = "${file("./script.sh")}"
  */
  network_interface {
    network    = var.vpc-id
    subnetwork = var.subnet-id
  }
}