###cloud vars


variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr_a" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "default_cidr_b" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###new

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform"
}

/*
variable "vm_web_name" { 
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name OS"
}


variable "vm_web_cores" {
  type        = string
  default     = "2"
  description = "Number of CPUs"
}

variable "vm_web_memory" {
  type        = string
  default     = "2"
  description = "Amount of memory"
}

variable "vm_web_core_fraction" {
  type        = string
  default     = "20"
  description = "core_fraction"
}
*/

variable "vm_web_preemptible" {
  type        = string
  default     = "true"
  description = "preemptiblen"
}

### locals var

variable "vm_name_prefix" {
  type        = string
  description = "Prefix for VM names"
  default     = "netology"
}

variable "vm_platform" {
  type        = string
  description = "Type for the web VM"
  default     = "platform"
}

variable "vm_type_db" {
  type        = string
  description = "Type for the db VM"
  default     = "db"
}

variable "vm_type_web" {
  type        = string
  description = "Type for the db VM"
  default     = "web"
}

variable "vm_env" {
  type        = string
  description = "Environment for VM (e.g., develop, production)"
  default     = "develop"
}



###ssh vars
/*
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgHCrfwpzi8plVPuatpNwJlszYXGrZs5Z3M3SGvnHuOp6mdA7v4Ylt7hFCSWcg9WceDlxPxvF7FfXgMLHxipZa80gyq7ye9vRnt6In9Ov4x5URenloQLs8dMWKKHdk0jebHgQ85ulsf6+xAnNyH2Hlqz5RwK6rT56/Td0qVStH26mXJ/Y+sxh75EuxWQJ4aTXF7dqmfF/fd/GYv+KB8BGn8IyHR0QFrNX1YQ5eAldXw7uM+5eW+en13vvwUBUeycBRRTMdn76DxcwrCv9fNZUMVVe8B6ledUVuPSwLd5+65kKtgCQhk6k1ZB/kQCIKLXxs+XZFbmPl8WpEwhi4NgjN vm30@vm30"

  description = "ssh-keygen -t ed25519"
}
*/

variable "vms_resources" {
  default = {
    web = {
      cores=2
      memory=2
      core_fraction=20
    }
    db = {
      cores=2
      memory=1
      core_fraction=20
    }
  }
}

variable "vms_metadata" {
  default = {
      serial-port-enable = 1
      ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgHCrfwpzi8plVPuatpNwJlszYXGrZs5Z3M3SGvnHuOp6mdA7v4Ylt7hFCSWcg9WceDlxPxvF7FfXgMLHxipZa80gyq7ye9vRnt6In9Ov4x5URenloQLs8dMWKKHdk0jebHgQ85ulsf6+xAnNyH2Hlqz5RwK6rT56/Td0qVStH26mXJ/Y+sxh75EuxWQJ4aTXF7dqmfF/fd/GYv+KB8BGn8IyHR0QFrNX1YQ5eAldXw7uM+5eW+en13vvwUBUeycBRRTMdn76DxcwrCv9fNZUMVVe8B6ledUVuPSwLd5+65kKtgCQhk6k1ZB/kQCIKLXxs+XZFbmPl8WpEwhi4NgjN vm30@vm30"
  }
}