resource "google_compute_router" "router" {
  name    = "router"
  network = var.vpc-name
  region  = var.region
}

resource "google_compute_router_nat" "nat-rules" {
  name                               = "nat-rules"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  # subnetwork                         = var.subnet-id
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" 

  subnetwork {
    name                    = var.subnet-name
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

