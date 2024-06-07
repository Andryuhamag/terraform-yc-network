resource "yandex_vpc_security_group" "security_group" {
  name        = var.sg_name
  description = var.sg_description
  network_id  = yandex_vpc_network.network.id

  dynamic "ingress" {
    for_each = var.ingress
    content {
      protocol       = ingress.value["protocol"]
      description    = ingress.value["description"]
      v4_cidr_blocks = ingress.value["v4_cidr_blocks"]
      from_port      = ingress.value["from_port"]
      to_port        = ingress.value["to_port"]
    }
  }

  dynamic "egress" {
    for_each = var.egress
    content {
      protocol       = egress.value["protocol"]
      description    = egress.value["description"]
      v4_cidr_blocks = egress.value["v4_cidr_blocks"]
      from_port      = egress.value["from_port"]
      to_port        = egress.value["to_port"]
    }
  }
}