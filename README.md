# Terraform модуль для создания сети в Yandex Cloud

## Данный модуль написан исключительно в образовательных целях.

Входные памаретры модуля:

| Название параметра | Тип                | Описание           | Значение по умолчанию |
|---------------------|--------------------|--------------------|--------------------|
| `network_name` | `string` | Имя сети | Есть |
| `network_description` | `string` | Описание сети | Есть |
| `sg_name` | `string` | Имя группы безопасности | Есть |
| `sg_description` | `string` | Описание группы безопасности | Есть |
| `subnets` | `list(object())` | Параметры подсетей | Есть |

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

  default = [
    {
      name        = "default-subnet-a"
      description = "Default subnet for ru-central1-a zone"
      zone        = "ru-central1-a"
      cidr        = ["10.0.1.0/28"]
    },
    {
      name        = "default-subnet-b"
      description = "Default subnet for ru-central1-b zone"
      zone        = "ru-central1-b"
      cidr        = ["10.0.2.0/28"]
    },
    {
      name        = "default-subnet-d"
      description = "Default subnet for ru-central1-d zone"
      zone        = "ru-central1-d"
      cidr        = ["10.0.4.0/28"]
    }
  ]
}
```

Выходные параметры модуля:

| Название параметра | Тип                | Описание           | Значение по умолчанию |
|---------------------|--------------------|--------------------|--------------------|
| `network_id` | `string` | ID сети |
| `sg_id` | `string` | ID группы безопасности |
| `subnets_info` | `list(map())` | Сведения о подсетях в виде списка ключ-значений ID подсети и зоны доступности |

### Вниминие

Группа безопасности разрешает все соединения в обе стороны, что не гарантирует защищеннность Вашей инфраструктуры. Требуется доработка.