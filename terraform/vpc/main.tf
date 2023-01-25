resource "google_compute_network" "vpc-1" {
  name                    = "vpc-1"
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}