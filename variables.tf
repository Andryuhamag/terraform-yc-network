#================== Network variables ==================#
variable "network_name" {
  description = "Network name"
  type        = string
  default     = "default-network"
}

variable "network_description" {
  description = "Network description"
  type        = string
  default     = "Default network"
}

#=============== Security goup variables ===============#
variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "default-sg"
}

variable "sg_description" {
  description = "Security group description"
  type        = string
  default     = "Default security group"
}

#================== Subnets variables ==================#
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

#============== Security group variables ===============#
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
      description    = "http"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 80
      to_port        = 80
    },
    {
      protocol       = "TCP"
      description    = "https"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 443
      to_port        = 443

    },
    {
      protocol       = "TCP"
      description    = "ssh"
      v4_cidr_blocks = ["0.0.0.0/0"]
      from_port      = 22
      to_port        = 22

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