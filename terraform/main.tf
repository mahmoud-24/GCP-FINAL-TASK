module "google_vpc" {
  source     = "./vpc"
  project_id = var.project_id
  region     = var.region
}

module "google_management-subnet" {
  source  = "./subnet"
  sub-name    = "management subnet"
  subnet-cidr = "10.0.1.0/24"
  region  = module.google_vpc.region
  vpc-1-name = module.google_vpc.vpc-name
}

module "google_restricted-subnet" {
  source  = "./subnet"
  sub-name    = "restricted subnet"
  subnet-cidr = "10.0.2.0/24"
  region  = module.google_vpc.region
  vpc-1-name = module.google_vpc.vpc-name
}

module "google_routing" {
  source  = "./nat-gateway"
  region  = module.google_vpc.region
  vpc-name = module.google_vpc.vpc-name
  subnet-id = module.google_management-subnet.subnet-id
  subnet-name = module.google_management-subnet.name
}

module "google_service-account" {
  source  = "./service-account"
  iam-role = var.iam-role
  project_id = var.project_id
}

module "google_vm" {
  source  = "./vm"
  zone = var.zone
  email = module.google_service-account.email
  image = var.image
  vpc-id = module.google_vpc.id
  subnet-id = module.google_management-subnet.subnet-id
}

module "google_GKE-cluster" {
  source  = "./GKE-cluster"
  zone = var.zone
  email = module.google_service-account.email
  vpc-name = module.google_vpc.vpc-name
  subnet-name = module.google_restricted.subnet-name
  subnet-cidr = module.google_management.subnet-cidr
}

