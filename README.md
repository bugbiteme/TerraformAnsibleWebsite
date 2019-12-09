# Static website Setup using Terraform and Ansible

In this project, we are creating a instance with webserver which serves static website, setup with ansible.

## Getting Started

use `ssh-keygen` to create `d_rsa`  and `id_rsa.pub` in the default location `(~/.ssh)`

First needs to run terraform with aws access key and secury key.

Terraform commands:

`terraform init`
 
`terraform plan`

`terraform apply`

`terraform destroy`


## Terraform apply will perform the following operations:
Terraform:

Create Network:
* Create VPC
    * Create CIDR Block
    * Enable DNS support
* Create Internet Gateway
    * Used VPC ID
* Create Subnet
    * Using VPC, CIDR
    * Map Public IP
    * Set AZ
* Create Routing Table
    * Using VPC ID
    * Set Route using CIDR Block and Gateway ID
* Create Routing Table Association
    * Using Subnet ID, Routing Table ID
* Create RSA SSH Key Pair from system public key (id_rsa by default)

Create Security Group:
* Create ingress security group for port 22 (SSH access)
* Create ingress security group for port 80 (HTTP access)
* Both part of VPC

Create EC2 Instance (VM):
* Create instance (Centos Linux)
* Create Elastic IP and assign to instance
* Do some stuff for Ansible prep:
    * Add EIP to Ansible inventory file

Create DNS record in AWS Route 53
* Create Route 53 Zone
* Create Rout 53 DNS record
    * A record, CName record

Call Ansible to do its thing:
* Wait for instance to provision
* Deploy apache and website using elastic IP

Ansible:
* Ensure apache is installed and started on newly created instance
    * Install httpd
    * Create required directories for website
    * Copy local httpd.conf file to VM
    * Copy index.html to proper location on VM
    * Start httpd service

Point browser to EIP and see the results!

use `terraform destroy` to clean up.
