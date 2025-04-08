###cloud vars
/*variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}
*/

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}


variable "default_zone" {
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type = list(object({
    name = string
    cidr = string
  }))
  default = [
    { name = "ru-central1-a", cidr = "10.0.1.0/24" },
    { name = "ru-central1-b", cidr = "10.0.2.0/24" },
    { name = "ru-central1-d", cidr = "10.0.3.0/24" }
  ]
}

variable "zone" {
  description = "ttps://cloud.yandex.ru/docs/overview/concepts/geo-scope"
  type        = string
  default     = "ru-central1-a"
}

variable "default2_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}


###common vars

variable "vms_ssh_root_key" {
  type        = list(string)
  default     = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCgHCrfwpzi8plVPuatpNwJlszYXGrZs5Z3M3SGvnHuOp6mdA7v4Ylt7hFCSWcg9WceDlxPxvF7FfXgMLHxipZa80gyq7ye9vRnt6In9Ov4x5URenloQLs8dMWKKHdk0jebHgQ85ulsf6+xAnNyH2Hlqz5RwK6rT56/Td0qVStH26mXJ/Y+sxh75EuxWQJ4aTXF7dqmfF/fd/GYv+KB8BGn8IyHR0QFrNX1YQ5eAldXw7uM+5eW+en13vvwUBUeycBRRTMdn76DxcwrCv9fNZUMVVe8B6ledUVuPSwLd5+65kKtgCQhk6k1ZB/kQCIKLXxs+XZFbmPl8WpEwhi4NgjN vm30@vm30"
  ]
  description = "ssh-keygen -t ed25519"
}

###example vm_web var
# variable "vm_web_name" {
#   type        = string
#   default     = "netology-develop-platform-web"
#   description = "example vm_web_ prefix"
# }

# ###example vm_db var
# variable "vm_db_name" {
#   type        = string
#   default     = "netology-develop-platform-db"
#   description = "example vm_db_ prefix"
# }


variable "ip_address" {
  type        = string
  description = "IP-адрес"
  default     = "192.168.0.1"

  validation {
    condition     = can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.ip_address))
    error_message = "Значение должно быть корректным IP-адресом."
  }
}

variable "ip_addresses_list" {
  type        = list(string)
  description = "Список IP-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]

  validation {
    condition = alltrue([for ip in var.ip_addresses_list : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))])
    error_message = "Все адреса в списке должны быть корректными IP-адресами."
  }
}

variable "string_variable" {
  description = "Любая строка, не содержащая символов верхнего регистра"
  type        = string
  default     = "what a nice day"

  validation {
    error_message = "Строка не должна содержать символов верхнего регистра"
    condition     = !(var.string_variable != lower(var.string_variable))
  }
}

variable "true-false" {
  description = "Who is better Connor or Duncan?"
  type = object({
    Dunkan  = optional(bool)
    Connor  = optional(bool)
  })

  default = {
    Dunkan = false
    Connor = true
  }

  validation {
    error_message = "There can be only one MacLeod"
    condition     = (var.true-false.Dunkan != var.true-false.Connor)
  }
}