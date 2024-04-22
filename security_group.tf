resource "yandex_vpc_security_group" "security_group" {
  name        = var.sg_name
  description = var.sg_description
  network_id  = yandex_vpc_network.network.id

  ingress {
    protocol       = "ANY"
    description    = "Any connections"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol       = "ANY"
    description    = "Any connections"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}