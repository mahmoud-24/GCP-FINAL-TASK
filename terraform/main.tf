module "google_vpc" {
  source     = "./vpc"
  project_id = var.project_id
  region     = var.region
}

module "google_management-subnet" {
  source      = "./subnet"
  subnet-name = "management subnet"
  subnet-cidr = "10.0.1.0/24"
  region      = var.region
  vpc-name    = var.vpc-name
}

module "google_restricted-subnet" {
  source      = "./subnet"
  subnet-name = "restricted subnet"
  subnet-cidr = "10.0.2.0/24"
  region      = var.region
  vpc-name    = var.vpc-name
}

module "google_routing" {
  source      = "./nat-gateway"
  region      = var.region
  vpc-name    = var.vpc-name
  subnet-id   = var.subnet-id
  subnet-name = var.subnet-name
}

module "google_service-account" {
  source     = "./service-account"
  iam-role   = var.iam-role
  project_id = var.project_id
}

module "google_vm" {
  source    = "./vm"
  zone      = var.zone
  email     = var.email
  image     = var.image
  vpc-id    = var.vpc-id
  subnet-id = module.google_management-subnet.subnet-id
}

module "google_GKE-cluster" {
  source      = "./GKE-cluster"
  zone        = var.zone
  email       = var.email
  vpc-name    = var.vpc-name
  subnet-name = module.google_restricted.subnet-name
  subnet-cidr = module.google_management.subnet-cidr
}