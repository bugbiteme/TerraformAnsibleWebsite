# Static website Setup using Terraform and Ansible

In this project, we are creating a instance with webserver which serves static website, setup with ansible.

## Getting Started

use ssh-keygen to create `d_rsa`  and `id_rsa.pub` in the default location `(~/.ssh)`

First needs to run terraform with aws access key and secury key.

Terraform commands:

terraform init
 
terraform plan

terraform apply

terraform destroy

Then run ansible to provision webserver servers.

Ansible command: ansible-playbook playbook.yml
