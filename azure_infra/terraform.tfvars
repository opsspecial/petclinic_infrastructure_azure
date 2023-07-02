# Rename this file to terraform.tfvars afte substituting the values

prefix   = "petclinic"
location = "eastus"

#agent Variables

agent_inbound_ports = ["22", "80", "8080"]
agent_vm_size       = "Standard_B2S"

#Web Variables
web_inbound_ports = ["8080"]
web_vm_size       = "Standard_B1s"
web_node_count    = 2

#Database Variables
db_inbound_ports = [3306]
db_vm_size       = "Standard_B1s"
db_node_count    = 0


# Web Variables
app_inbound_ports = ["8080"]
app_vm_size       = "Standard_B1s"
app_node_count    = 0

#common VM variables
username   = "azadmin"
pubkeypath = "/tmp/id_az.pub"

destination_ssh_key_path = "/home/azadmin/.ssh/authorized_keys"
application_port         = 8080
frontend_port            = 80

tags = {
  Project     = "tfdemo"
  DeployMode  = "Terraform"
  Environment = "dev"
}
