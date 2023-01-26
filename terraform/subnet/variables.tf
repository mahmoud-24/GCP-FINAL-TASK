variable "subnet-name" {
    type    = string
}

variable "subnet-cidr" {
}

variable "region" {
    default     = "us-central1"
    type        = string
    description = "defualt us-central1"
}

variable "vpc-id" {
    type    = string
}