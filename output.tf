output "network_id" {
  value = yandex_vpc_network.network.id
}
output "sg_id" {
  value = yandex_vpc_security_group.security-group.id
}
output "subnet_a_id" {
  value = yandex_vpc_subnet.subnet-a.id
}
output "subnet_b_id" {
  value = yandex_vpc_subnet.subnet-b.id
}
output "subnet_c_id" {
  value = yandex_vpc_subnet.subnet-c.id
}
output "subnet_d_id" {
  value = yandex_vpc_subnet.subnet-d.id
}