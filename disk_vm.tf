resource "yandex_compute_disk" "disk" {
  count = 3
  name = "disk-${count.index+1}"
}

resource "yandex_compute_instance" "disk_test" {
  depends_on = [ yandex_compute_disk.disk ]
  name        = var.test_disk.name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.test_disk.cores
    memory        = var.test_disk.memory
    core_fraction = var.test_disk.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic "secondary_disk" {
    for_each = toset(yandex_compute_disk.disk[*].id)
    content {
      disk_id = secondary_disk.key
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
    user-data = "${file("./meta.cloud-init.yml")}"
  }
}
