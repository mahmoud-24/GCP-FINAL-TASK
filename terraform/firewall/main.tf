resource "google_compute_firewall" "firewall" {
  name          = "firewall"
  source_ranges = ["0.0.0.0/0"]
  network       = google_compute_network.vpc-1.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22","80"]
  }
}