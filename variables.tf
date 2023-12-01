#=============== Network variables ===============#
variable "network_name" {
  description = "Network name"
  type        = string
  default     = "default-network"
}
variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "default-sg"
}
variable "network_description" {
  description = "Network description"
  type        = string
  default     = "Default network"
}
variable "subnet_a_name" {
  description = "Name of subnet for zone ru-central1-a"
  type        = string
  default     = "default-subnet-a"
}
variable "subnet_a_cidr_blocks" {
  description = "value"
  default     = ["10.1.0.0/16"]
}
variable "subnet_b_name" {
  description = "Name of subnet for zone ru-central1-b"
  type        = string
  default     = "default-subnet-b"
}
variable "subnet_b_cidr_blocks" {
  description = "value"
  default     = ["10.2.0.0/16"]
}
variable "subnet_c_name" {
  description = "Name of subnet for zone ru-central1-c"
  type        = string
  default     = "default-subnet-c"
}
variable "subnet_c_cidr_blocks" {
  description = "value"
  default     = ["10.3.0.0/16"]
}
variable "subnet_d_name" {
  description = "Name of subnet for zone ru-central1-d"
  type        = string
  default     = "default-subnet-d"
}
variable "subnet_d_cidr_blocks" {
  description = "value"
  default     = ["10.4.0.0/16"]
}
