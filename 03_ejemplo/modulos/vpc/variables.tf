variable "vpc_cidr" {}
variable "vpc_name" {}
variable "subnet_publica_cidr" {}
variable "subnet_publica_cidr_2" {}
variable "subnet_privada_cidr" {}
variable "subnet_privada_cidr_2" {
  description = "CIDR para la segunda subred privada"
  type        = string
}