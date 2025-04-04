output "vm_info" {
  value = {
    test-vm = {
        external_ip_address = module.test-vm.external_ip_address
        labels   = module.test-vm.labels
        fqdn = module.test-vm.fqdn
    }
    example-vm = {
        external_ip_address = module.example-vm.external_ip_address
        labels   = module.example-vm.labels
        fqdn = module.example-vm.fqdn
  }
  }
}

output "subnet_id" {
  value = module.vpc.subnet_id
}
