/*
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}
*/

module "vpc" {
  source        = "./modules/vpc"
  name          = var.vpc_name
  default_zone  = var.default_zone
  zone          = var.zone
  default_cidr = var.default2_cidr

}

module "test-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "develop"
  network_id     = module.vpc.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc.subnet_id[0]]
  instance_name  = "webs"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true
  preemptible    = true

  labels = {
    owner= "v.padeev",
    project = "marketing"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

module "example-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = "stage"
  network_id     = module.vpc.network_id
  subnet_zones   = ["ru-central1-a"]
  subnet_ids     = [module.vpc.subnet_id[0]]
  instance_name  = "web-stage"
  instance_count = 1
  image_family   = "ubuntu-2004-lts"
  public_ip      = true
  preemptible    = true

  labels = {
    owner= "v.padeev",
    project = "analytics"
     }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
    serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
  template = file("/home/vm30/homework/16.4/src/cloud-init.yml")

  vars = {
    vms_ssh_root_key = join("\n", var.vms_ssh_root_key)
  }

}
