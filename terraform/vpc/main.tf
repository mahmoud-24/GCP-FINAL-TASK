resource "google_compute_network" "vpc-1" {
  name                    = "vpc-1"
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  region                  = var.region
}


resource "google_compute_firewall" "firewall" {
  name          = "firewall"
  source_ranges = ["0.0.0.0/0"]
  network       = google_compute_network.vpc-1.name

  allow {
    protocol = "tcp"
    ports    = ["22","80"]
  }
}