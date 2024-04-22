output "network_id" {
  value = yandex_vpc_network.network.id
}

output "sg_id" {
  value = yandex_vpc_security_group.security_group.id
}

output "subnets_info" {
  value = [for k, v in yandex_vpc_subnet.subnet : zipmap(["subnet_id", "zone"], [yandex_vpc_subnet.subnet[v.name].id, yandex_vpc_subnet.subnet[v.name].zone])]
}