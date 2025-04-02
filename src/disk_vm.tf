# Creating disks using count
resource "yandex_compute_disk" "storage_disks" {
  count = var.disk_params.count

  name     = "${var.disk_params.name_prefix}-${count.index}"
  type     = var.disk_params.type
  zone     = var.disk_params.zone
  size     = var.disk_params.size
}

# Create a single VM
resource "yandex_compute_instance" "storage" {
  name = var.vm_params.vm_name
  zone = var.vm_params.zone

  resources {
    cores  = var.vm_params.cpu
    memory = var.vm_params.ram
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vm_params.size
    }
  }

   network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_params.nat
  }

  # Connecting disks via dynamic + for_each
  dynamic "secondary_disk" {
    for_each = { for d in yandex_compute_disk.storage_disks : d.id => d }
    content {
      disk_id = secondary_disk.key
    }
  }
}