region     = "us-central1"
project_id = "mahmoud-ibrahim-2-project"
zone       = "us-central1-b"
image      = "ubuntu-os-cloud/ubuntu-2204-lts"
vpc-name   = "vpc-1"
subnet-name = "restricted-subnet"
subnet-cidr = "10.0.1.0/24"






# credentials_file_path = "./service-account-credentials.json"
iam-role =[ "resourcemanager.projects.get", "storage.buckets.get", "storage.buckets.list" , "storage.objects.get" , "storage.objects.list" ,
   "container.deployments.get" , "container.deployments.create" , "container.deployments.list" , "container.services.list" , "container.services.get" ,
    "container.services.create" , "container.clusters.list" , "container.clusters.getCredentials" , "container.clusters.get" , "container.pods.list" ,
     "container.nodes.list" ]



