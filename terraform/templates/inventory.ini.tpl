[web]
%{ for host in hosts ~}
${host.tags.Name} ansible_host=${host.public_ip} ansible_ssh_private_key_file=~/.ssh/${host.key_name}
%{ endfor ~}

[web:vars]
ansible_user=ec2_user
