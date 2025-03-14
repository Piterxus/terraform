variable "vpc_name" {
  type        = string
  description = "Nombre de la VPC"
}

variable "cidr_block" {
  type        = string
  description = "CIDR principal de la VPC"
}

variable "public_subnet" {
  type        = string
  description = "CIDR del Subnet Público"
}

variable "private_subnet" {
  type        = string
  description = "CIDR del Subnet Privado"
}
