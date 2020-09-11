output "base_domain_nameservers" {  
  value = "${module.dnsModule.domain_name_servers}"
}

output "elasic_ip_address" {
  value = "${module.instanceModule.testInstanceEip}"
}
