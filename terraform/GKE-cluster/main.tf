resource "google_container_cluster" "private-cluster" {
  name     = "private-cluster"
  location = var.zone

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc-name
  subnetwork = var.subnet-name

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.subnet-cidr
    }
  }
  ip_allocation_policy {

  }
  node_config {
  service_account = var.email
    oauth_scopes  = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"  
  }
}

resource "google_container_node_pool" "private-cluster_node_pool" {

  name           = "${google_container_cluster.private-cluster.name}--node-pool"
  location       = google_container_cluster.private-cluster.location
  cluster        = google_container_cluster.private-cluster.name
  node_count     = 1

  node_config {
    preemptible  = true
    machine_type = "e2-micro"

    service_account = var.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform" 
    ]
 }
}