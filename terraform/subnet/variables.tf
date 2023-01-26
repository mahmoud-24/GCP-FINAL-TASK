variable "subnet-name" {
    type    = string
}

variable "subnet-cidr" {
}

variable "vpc-name" {
    type    = string
}

variable "region" {
    default     = "us-central1"
    type        = string
    description = "defualt us-central1"
}