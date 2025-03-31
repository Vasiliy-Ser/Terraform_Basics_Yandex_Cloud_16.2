output "vm_info" {
  value = {
    web_instance = {
      instance_name = yandex_compute_instance.platform.name
      external_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
      fqdn          = "${yandex_compute_instance.platform.name}.example.com"
    },
    db_instance = {
      instance_name = yandex_compute_instance.db.name
      external_ip   = yandex_compute_instance.db.network_interface.0.nat_ip_address
      fqdn          = "${yandex_compute_instance.db.name}.example.com"
    }
  }

  description = "Information about instances including name, external IP, and FQDN."
}
