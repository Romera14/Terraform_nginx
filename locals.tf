locals {
  web_name = "${var.vm_web_name}-${var.vm_web_resources.cores}"
  db_name = "${var.vm_db_name}-${var.vm_db_resources.cores}"
}

