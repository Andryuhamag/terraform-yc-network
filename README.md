## Terraform модуль для создания сети в Yandex Cloud

Входные памаретры модуля:

| Название параметра    | Тип              | Описание                                       | Значение по умолчанию |
|-----------------------|------------------|------------------------------------------------|-----------------------|
| `network_name`        | `string`         | Имя сети                                       | Есть |
| `network_description` | `string`         | Описание сети                                  | Есть |
| `sg_name`             | `string`         | Имя группы безопасности                        | Есть |
| `sg_description`      | `string`         | Описание группы безопасности                   | Есть |
| `subnets`             | `list(object())` | Параметры подсетей                             | Есть |
| `ingress`             | `list(object())` | Правила входящего трафика группы безопасности  | Есть |
| `egress`              | `list(object())` | Правила исходящего трафика группы безопасности | Есть |

Подсети описаны в виде:

```
variable "subnets" {

  type = list(
    object(
      {
        name        = string,
        description = string,
        zone        = string,
        cidr        = list(string)
      }
    )
  )
}
```

Правила трафика описаны в виде:

```
variable "ingress" {

  type = list(
    object(
      {
        protocol       = string,
        description    = string,
        v4_cidr_blocks = list(string)
        from_port      = number
        to_port        = number
      }
    )
  )
}

variable "egress" {

  type = list(
    object(
      {
        protocol       = string,
        description    = string,
        v4_cidr_blocks = list(string)
        from_port      = number
        to_port        = number
      }
    )
  )
}
```

Выходные параметры модуля:

| Название параметра | Тип           | Описание | Значение по умолчанию |
|--------------------|---------------|----------|-----------------------|
| `network_id`       | `string`      | ID сети |
| `sg_id`            | `string`      | ID группы безопасности |
| `subnets_info`     | `list(map())` | Сведения о подсетях в виде списка ключ-значений ID подсети и зоны доступности |

Пример использования:

```
variable "network_name" {
  description = "Network name"
  type        = string
  default     = "my-network"
}

variable "network_description" {
  description = "Network description"
  type        = string
  default     = "My network"
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "my-sg"
}

variable "sg_description" {
  description = "Security group description"
  type        = string
  default     = "My security group"
}

variable "subnets" {

  type = list(
    object(
      {
        name        = string,
        description = string,
        zone        = string,
        cidr        = list(string)
      }
    )
  )

  default = [
    {
      name        = "my-subnet-a"
      description = "My subnet for ru-central1-a zone"
      zone        = "ru-central1-a"
      cidr        = ["10.1.1.0/28"]
    },
    {
      name        = "my-subnet-b"
      description = "My subnet for ru-central1-b zone"
      zone        = "ru-central1-b"
      cidr        = ["10.1.2.0/28"]
    },
    {
      name        = "my-subnet-d"
      description = "My subnet for ru-central1-d zone"
      zone        = "ru-central1-d"
      cidr        = ["10.1.4.0/28"]
    }
  ]
}

variable "ingress" {

  type = list(
    object(
      {
        protocol       = string,
        description    = string,
        v4_cidr_blocks = list(string)
        from_port      = number
        to_port        = number
      }
    )
  )

  default = [
    {
      protocol       = "TCP"
      description    = "Http only"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 80
      to_port        = 80
    },
    {
      protocol       = "TCP"
      description    = "Https only"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 443
      to_port        = 443
    }
  ]
}

variable "egress" {

  type = list(
    object(
      {
        protocol       = string,
        description    = string,
        v4_cidr_blocks = list(string)
        from_port      = number
        to_port        = number
      }
    )
  )

  default = [
    {
      protocol       = "ANY"
      description    = "Any connections"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 0
      to_port        = 65535
    }
  ]
}


module "network" {
  source              = "git@github.com:Andryuhamag/terraform-yc-network.git?ref=v0.2"
  network_name        = var.network_name
  network_description = var.network_description
  sg_name             = var.sg_name
  sg_description      = var.sg_description
  subnets             = var.subnets
  ingress             = var.ingress
  egress              = var.egress
}

```