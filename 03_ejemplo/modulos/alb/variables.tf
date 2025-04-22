variable "lb_name" {}
variable "target_group_name" {}
variable "vpc_id" {}

variable "security_group_alb_id" {
  description = "The security group ID for the load balancer"
  type        = string
}


variable "instance_id_amazon_linux_1" {
  description = "Instance ID for the Amazon Linux instance"
  type        = string
}

variable "instance_id_ubuntu_1" {
  description = "Instance ID for the first Ubuntu instance"
  type        = string
}

variable "subnets" {
  description = "Lista de IDs de subnets públicas donde desplegar el ALB"
  type        = list(string)
}