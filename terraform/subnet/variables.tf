variable "subnet-name" {
    type    = string
}

variable "subnet-cidr" {
}

variable "region" {
    default     = "us-east4"
    type        = string
    description = "defualt us-east4"
}

variable "vpc-id" {
    type    = string
}
