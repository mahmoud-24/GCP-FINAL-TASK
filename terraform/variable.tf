variable "region" {
    default     = "us-central1"
    type        = string
    description = "defualt us-central1"
}

variable "project_id" {
  type        = string
  description = "The ID of my project"
}

variable "zone" {
  type        = string
  description = "The primary zone"
}

variable "image" {
  type        = string
  description = "The OS image"
}

# variable "credentials_file_path" {
#   type        = string
#   description = "The credentials JSON file used to authenticate with GCP"
# }

variable "service_account" {
  type        = string
  description = "The GCP service account"
}

variable "iam-role" {
    type    = list
}