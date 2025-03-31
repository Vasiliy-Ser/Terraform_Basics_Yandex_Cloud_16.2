resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop-a" {
  name           = "${var.vpc_name}-a"
  zone           = var.default_zone_a  # zona vm1
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_a
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_subnet" "develop-b" {
  name           = "${var.vpc_name}-b"
  zone           = var.default_zone_b  # zona vm2
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr_b
  route_table_id = yandex_vpc_route_table.rt.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  name = "test-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  name = "test-route-table"
  network_id     = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }  
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  zone        = var.default_zone_a
  platform_id = var.vm_web_platform_id
  resources {
#    cores         = var.vm_web_cores
    cores         = var.vms_resources.web.cores
#    memory        = var.vm_web_memory
    memory        = var.vms_resources.web.memory
#    core_fraction = var.vm_web_core_fraction
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-a.id
    nat       = false
  }

  metadata = var.vms_metadata
  #{
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
 #}
}

#Second vm

resource "yandex_compute_instance" "db" {
  name        = local.vm_db_name
  zone        = var.default_zone_b
  platform_id = var.vm_db_platform_id
  resources {
#    cores         = var.vm_db_cores
    cores         = var.vms_resources.db.cores
#    memory        = var.vm_db_memory
    memory        = var.vms_resources.db.memory
#    core_fraction = var.vm_db_core_fraction
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop-b.id
    nat       = false
  }

  metadata = var.vms_metadata
  #{
#    serial-port-enable = 1
#    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
 #}
}
