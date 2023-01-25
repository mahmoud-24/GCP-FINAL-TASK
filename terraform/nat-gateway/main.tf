resource "google_compute_address" "nat-ip" {
  name   = "nat-address-ip"
  region = google_compute_subnetwork.subnet.region
}

resource "google_compute_router" "router" {
  name    = "router"
  network = google_compute_network.vpc-1.id
  region  = google_compute_subnetwork.subnet.region
}

resource "google_compute_router_nat" "nat-rules" {
  name                               = "nat-rules"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  subnetwork                         = google_compute_subnetwork.management-subnet.id
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [ google_compute_address.ipnat.self_link ] ###??
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS" ###??

  # subnetwork {
  #   name                    = google_compute_subnetwork.subnet.name
  #   source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  # }

  # log_config {
  #   enable = true
  #   filter = "ERRORS_ONLY"
  # }
}

resource "google_compute_route" "egress_internet" {
  name             = "egress-internet"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc-1.id
  next_hop_gateway = "default-internet-gateway"
}