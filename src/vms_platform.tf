###cloud vars


#variable "cloud_id" {
#  type        = string
#  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
#}

/*  variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
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
*/
###new

variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform"
}

/*
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name OS"
}

variable "vm_db_cores" {
  type        = string
  default     = "2"
  description = "Number of CPUs"
}

variable "vm_db_memory" {
  type        = string
  default     = "1"
  description = "Amount of memory"
}

variable "vm_db_core_fraction" {
  type        = string
  default     = "20"
  description = "core_fraction"
}
*/

variable "vm_db_preemptible" {
  type        = string
  default     = "true"
  description = "preemptiblen"
}

variable "db_zone" {
  description = "add zona"
  type        = string
  default     = "ru-central1-b"
}

###ssh vars
/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgHCrfwpzi8plVPuatpNwJlszYXGrZs5Z3M3SGvnHuOp6mdA7v4Ylt7hFCSWcg9WceDlxPxvF7FfXgMLHxipZa80gyq7ye9vRnt6In9Ov4x5URenloQLs8dMWKKHdk0j>

  description = "ssh-keygen -t ed25519"
}

*/
