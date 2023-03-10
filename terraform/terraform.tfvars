region      = "us-east4"
project_id  = "mahmoud-ibrahim-2-project"
zone        = "us-east4-b"
image       = "ubuntu-os-cloud/ubuntu-2204-lts"
vpc-name    = "vpc-1"
subnet-name = "restricted-subnet"
subnet-cidr = "10.0.1.0/24"
credentials = "./mahmoud-ibrahim-2-project-ba418b2bb3b8.json"

iam-role    =[ "resourcemanager.projects.get", "storage.buckets.get", "storage.buckets.list" , "storage.objects.get" , "storage.objects.list" ,
   "container.deployments.get" , "container.deployments.create" , "container.deployments.list" , "container.deployment.delete" , "container.services.list" , "container.services.get" ,
    "container.services.create" , "container.clusters.list" , "container.clusters.getCredentials" , "container.clusters.get" , "container.pods.list" ,
     "container.nodes.list" ]




