resource "yandex_vpc_network" "network" {
  name        = var.network_name
  description = var.network_description
}

resource "yandex_vpc_subnet" "subnet" {
  for_each = {
    for k, v in var.subnets : "${v.name}" => v
  }
  network_id     = yandex_vpc_network.network.id
  name           = each.value.name
  description    = each.value.description
  zone           = each.value.zone
  v4_cidr_blocks = each.value.cidr
}
