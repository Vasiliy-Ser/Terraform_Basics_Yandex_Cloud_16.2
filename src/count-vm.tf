resource "yandex_compute_instance" "web" {
  count = var.vm_web_params.count
  name  = "${var.vm_web_params.vm_name}-${count.index + 1}" # web-1 и web-2
  zone  = var.default_zone

  resources {
    cores         = var.vm_web_params.cpu
    memory        = var.vm_web_params.ram
    core_fraction = var.vm_web_params.core_fraction
  }

  boot_disk {
    initialize_params {
      size = var.vm_web_params.disk_size
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_params.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_params.nat
  }

  metadata = var.vms_metadata

  depends_on = [yandex_compute_instance.db] # Ожидаем создания DB-серверов
}