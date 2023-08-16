###cloud vars

variable "vpc_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vpc_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "subnet-create"
}

variable "vpc_network_name" {
  type        = string
  description = "VPC network name"
}

variable "vpc_subnet_name" {
  type        = string
  description = "VPC subnet name"
}