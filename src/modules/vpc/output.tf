/*
output "network_id" {
  description = "network_id"
  value = yandex_vpc_network.develop[*].id
}
*/

output "network_id" {
  description = "ID сети"
  value       = yandex_vpc_network.develop.id  # Это строка
}

output "subnet_id" {
  description = "ID подсетей"
  value       = [for subnet in yandex_vpc_subnet.develop : subnet.id]  # Это список строк
}