variable "region" {
    default     = "us-central1"
    type        = string
    description = "defualt us-central1"
}

variable "project_id" {
  type        = string
  description = "The ID of my project"
}

variable "main_zone" {
  type        = string
  description = "The primary zone"
}

variable "credentials_file_path" {
  type        = string
  description = "The credentials JSON file used to authenticate with GCP"
}

variable "service_account" {
  type        = string
  description = "The GCP service account"
}


/*
variable "cluster_node_zones" {
  type = list(string)
  description = "The zones where Kubernetes cluster worker nodes should be located"
}
*/