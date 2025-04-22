variable "vpc_id" {
  description = "ID de la VPC donde estará la RDS"
  type        = string
}
variable "subnet_privada_id" {
  description = "ID de la subred privada principal"
  type        = string
}

variable "subnet_privada_id_2" {
  description = "ID de la segunda subred privada"
  type        = string
}
variable "security_group" {}
variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
}
variable "db_username" {
  description = "Usuario administrador de la base de datos"
  type        = string
}
variable "db_password" {
  description = "Contraseña del usuario administrador de la base de datos"
  type        = string
}
variable "db_instance_type" {}
