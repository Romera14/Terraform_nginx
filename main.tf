resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

output "yandex_compute_instance_platform_name" {
  value       = yandex_compute_instance.platform[*].name
}

output "yandex_compute_instance_test_for" {
  depends_on = [ yandex_compute_instance.test_for ]
  value = [for i in var.vm_test : yandex_compute_instance.test_for[i.vm_name].name]
}
