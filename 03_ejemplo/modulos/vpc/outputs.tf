output "vpc_id" {
  value = aws_vpc.mi_vpc.id

}

output "subnet_publica_id" {
  value = aws_subnet.subnet_publica.id

}

output "subnet_publica_2_id" {
  value = aws_subnet.subnet_publica_2.id
}

output "subnet_privada_id" {
  value = aws_subnet.subnet_privada.id
}

output "subnet_privada_id_2" {
  value = aws_subnet.subnet_privada_2.id
}