###cloud vars
variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
}

variable "vm_web_resources" {
  type = map(number)
  default = {
    cores = 2
    memory = 1
    core_fraction = 5
  }
}

variable "vm_metadata" {
  type = map(string)
  default = {
    serial-port-enable = "1"
  }
}

variable "vm_web_famaly" {
  type        = string
  default     = "ubuntu-2004-lts"
}
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "user_ssh_key" {
  sensitive = true
}

variable "token" {
  type        = string
}

variable "folder_id" {
  type        = string
}