variable "default_zone" {
  description = "ttps://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type = list(object({
    name = string
    cidr = string
  }))
#  type        = string
#  default     = "ru-central1-a"
#0  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone" {
  description = "ttps://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type        = string
  default     = "ru-central1-a"
}

variable "default_cidr" {
  type        = list(string)
#  default     = ["10.0.0.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "name" {
  type        = string
#  default     = "develop"
  description = "VPC network&subnet name"
}