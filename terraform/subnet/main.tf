resource "google_compute_subnetwork" "subnet" {
  name                     = var.sub-name
  ip_cidr_range            = var.subnet-cidr
  region                   = var.region
  network                  = var.vpc-1-name 
  private_ip_google_access = true                   
}