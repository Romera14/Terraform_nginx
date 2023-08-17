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
  source = "./vpc"
  vpc_network_name = var.vpc_name
  vpc_subnet_name = var.vpc_name
  vpc_zone = var.default_zone
  vpc_cidr = var.default_cidr
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = module.vpc.vpc_network_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [module.vpc.vpc_subnet_id]
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data   = "${file("/home/paromov/ter-homeworks/04/src/meta.txt")}"
  }
  
}
