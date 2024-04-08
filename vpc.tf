resource "yandex_vpc_network" "network" {
  name        = var.network_name
  description = var.network_description
}
resource "yandex_vpc_subnet" "subnet-a" {
  name           = var.subnet_a_name
  v4_cidr_blocks = var.subnet_a_cidr_blocks
  network_id     = yandex_vpc_network.network.id
  zone           = "ru-central1-a"
}
resource "yandex_vpc_subnet" "subnet-b" {
  name           = var.subnet_b_name
  v4_cidr_blocks = var.subnet_b_cidr_blocks
  network_id     = yandex_vpc_network.network.id
  zone           = "ru-central1-b"
}
resource "yandex_vpc_subnet" "subnet-d" {
  name           = var.subnet_d_name
  v4_cidr_blocks = var.subnet_d_cidr_blocks
  network_id     = yandex_vpc_network.network.id
  zone           = "ru-central1-d"
}
