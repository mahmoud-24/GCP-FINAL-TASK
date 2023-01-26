region                = "us-central1"
project_id            = "mahmoud-ibrahim-2-project"
zone             = "us-central1-b"
image = "ubuntu-os-cloud/ubuntu-2204-lts"
# credentials_file_path = "./service-account-credentials.json"
# service_account       = "my-project@my-project-113346.iam.gserviceaccount.com"
# cluster_node_zones    = ["europe-west3-b"]
iam-role =[ "resourcemanager.projects.get", "storage.buckets.get", "storage.buckets.list" , "storage.objects.get" , "storage.objects.list" ,
   "container.deployments.get" , "container.deployments.create" , "container.deployments.list" , "container.services.list" , "container.services.get" ,
    "container.services.create" , "container.clusters.list" , "container.clusters.getCredentials" , "container.clusters.get" , "container.pods.list" ,
     "container.nodes.list" ]



