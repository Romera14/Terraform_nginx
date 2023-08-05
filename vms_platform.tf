variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "vm_db_resources" {
  type = map(number)
  default = {
    cores = 2
    memory = 2
    core_fraction = 5
  }
}

variable "vm_db_cores" {
  type        = string
  default     = "2"
}
variable "vm_db_memory" {
  type        = string
  default     = "2"
}
variable "vm_db_core_fraction" {
  type        = string
  default     = "5"
}

variable "vm_db_famaly" {
  type        = string
  default     = "ubuntu-2004-lts"
}
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
}