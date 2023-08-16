terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

resource "yandex_vpc_network" "vpc_network" {
  name = var.vpc_network_name
}
resource "yandex_vpc_subnet" "vpc_subnet" {
  name           = var.vpc_subnet_name
  zone           = var.vpc_zone
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = var.vpc_cidr
}

