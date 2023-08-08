resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { 
       platform-vm = yandex_compute_instance.platform,
       test_for-vm = yandex_compute_instance.test_for,
       disk_test-vm = yandex_compute_instance.disk_test
    } 
  )

  filename = "${abspath(path.module)}/inventory"
}