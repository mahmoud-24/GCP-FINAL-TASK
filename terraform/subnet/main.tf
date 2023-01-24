resource "google_compute_subnetwork" "management-subnet" {
  name          = "management-subnet"
  ip_cidr_range = var.management-subnet-cidr
  region        = var.region
  network       = google_compute_network.vpc-1.id   ####
  private_ip_google_access = true                   ####
}


resource "google_compute_subnetwork" "restricted-subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = var.restricted-subnet-cidr
  region        = var.region
  network       = google_compute_network.vpc-1.id
  private_ip_google_access = true
}