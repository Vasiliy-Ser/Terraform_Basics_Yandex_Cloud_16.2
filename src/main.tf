resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

output "vm_info_web" {
  value = [
    for vm in yandex_compute_instance.web : {
      name = vm.name
      id   = vm.id
      fqdn = "${vm.name}.internal"
    }
  ]
}

output "vm_info_db" {
  value = [
    for vm in yandex_compute_instance.db : {
      name = vm.name
      id   = vm.id
      fqdn = "${vm.name}.internal"
    }
  ]
}

output "vm_info_storage" {
  value = [
    for vm in [ yandex_compute_instance.storage ] : {
      name = vm.name
      id   = vm.id
      fqdn = "${vm.name}.internal"
    }
  ]
}