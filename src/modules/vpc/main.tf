terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8"
}

resource "yandex_vpc_network" "develop" {
  name = var.name
}
resource "yandex_vpc_subnet" "develop" {
  for_each = { for zone in var.default_zone : zone.name => zone }

  name           = "${var.name}-${each.key}-subnet"
  zone           = each.key
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [each.value.cidr]


 # name           = "${var.name}-subnet"
 # zone           = var.default_zone
 # network_id     = yandex_vpc_network.develop.id
 # v4_cidr_blocks = var.default_cidr
}
