###cloud vars
#variable "token" {
#  type        = string
#  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
#}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
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
  description = "VPC network&subnet name"
}

###new

variable "vm_web_params" {
  type = object({
    count         = number
    vm_name       = string
    zone          = string
    cpu           = number
    ram           = number
    core_fraction = number
    disk_size     = number
    preemptible   = string
    nat           = string
  })
  default = {
    count         = 2
    vm_name       = "web"
    zone          = "ru-central1-a"
    cpu           = 2
    ram           = 2
    core_fraction = 20
    disk_size     = 10
    preemptible   = "true"
    nat           = "true"
  }
  description = "Parameters of VM web (count)"
}

variable "vm_db_params" {
  type = list(object({
    vm_name       = string
    zone          = string
    cpu           = number
    ram           = number
    core_fraction = number
    disk_size     = number
    preemptible   = string
    nat           = string
  }))
  default = [
    {
      vm_name       = "main"
      zone          = "ru-central1-a"
      cpu           = 2
      ram           = 2
      core_fraction = 20
      disk_size     = 10
      preemptible   = "true"
      nat           = "true"
    },
    {
      vm_name       = "replica"
      zone          = "ru-central1-a"
      cpu           = 2
      ram           = 1
      core_fraction = 20
      disk_size     = 15
      preemptible   = "true"
      nat           = "true"
    }
  ]
  description = "Parameters of VM db (for_each)"
}

variable "vms_metadata" {
  default = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgHCrfwpzi8plVPuatpNwJlszYXGrZs5Z3M3SGvnHuOp6mdA7v4Ylt7hFCSWcg9WceDlxPxvF7FfXgMLHxipZa80gyq7ye9vRnt6In9Ov4x5URenloQLs8dMWKKHdk0jebHgQ85ulsf6+xAnNyH2Hlqz5RwK6rT56/Td0qVStH26mXJ/Y+sxh75EuxWQJ4aTXF7dqmfF/fd/GYv+KB8BGn8IyHR0QFrNX1YQ5eAldXw7uM+5eW+en13vvwUBUeycBRRTMdn76DxcwrCv9fNZUMVVe8B6ledUVuPSwLd5+65kKtgCQhk6k1ZB/kQCIKLXxs+XZFbmPl8WpEwhi4NgjN vm30@vm30"
  }
}

variable "ssh_key_path" {
  type        = string
  default     = "~/.ssh/id_rsa.pub"
  description = "Path to public SSH key"
}

variable "disk_params" {
  type = object({
    count       = number
    name_prefix = string
    type        = string
    zone        = string
    size        = number
  })
  default = {
    count       = 3
    name_prefix = "storage-disk"
    type        = "network-hdd"
    zone        = "ru-central1-a"
    size        = 1 
  }
}

variable "vm_params" {
  type = object({
    vm_name     = string
    cpu         = number
    ram         = number
    nat         = string
    size        = number
    zone        = string
  })
  default = {
    vm_name     = "storage"
    cpu         = 2
    ram         = 2
    nat         = "true" 
    size        = 10
    zone        = "ru-central1-a"
  }
}