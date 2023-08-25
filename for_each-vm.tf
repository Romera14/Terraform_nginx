
resource "yandex_compute_instance" "test_for" {
  depends_on = [ yandex_compute_instance.platform ]
  for_each = { for a,b in var.vm_test: b.vm_name => b }
  name        = each.value["vm_name"]
  platform_id = var.vm_web_platform_id
  resources {
    cores         = each.value["cpu"]
    memory        = each.value["ram"]
    core_fraction = each.value["core"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value["disk"]
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    user-data = "${file("./cloud-init.yml")}"
  }
}
/* ВТОРОЙ ВАРИАНТ
resource "yandex_compute_instance" "platform1" {
  for_each = var.vm_test
  name        = each.value["vm_name"]
  platform_id = var.vm_web_platform_id
  resources {
    cores         = each.value["cpu"]
    memory        = each.value["ram"]
    core_fraction = each.value["core"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value["disk"]
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  metadata = {
    ssh-keys           = var.user_ssh_key
  }
}
*/
