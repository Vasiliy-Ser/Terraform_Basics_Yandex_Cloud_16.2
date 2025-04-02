locals {
 # ssh_public_key = file(var.ssh_key_path)
  db_vm = {
    #for vm in var.vm_db_params : vm.vm_name => vm
    for vm in var.vm_db_params : vm.vm_name => vm
  }
}

resource "yandex_compute_instance" "db" {
  for_each = local.db_vm

  name = each.value.vm_name
  zone = var.default_zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_size
    }
  }

  scheduling_policy {
    preemptible = each.value.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = each.value.nat
  }

  metadata = var.vms_metadata
}
/*
output "webserver_names" {
  value = local.webserver_names
}

output "db_names" {
  value = local.db_names
}

output "storage_names" {
  value = local.storage_names
}
*/