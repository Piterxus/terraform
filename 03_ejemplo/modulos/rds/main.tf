resource "aws_db_subnet_group" "mi_subnet_group" {
  name       = "mi-subnet-group"
  subnet_ids = [
    var.subnet_privada_id,
    var.subnet_privada_id_2,
  ]
}

resource "aws_db_instance" "mi_rds" {
  identifier         = "mi-rds-instance"
  engine             = "mysql"
  instance_class     = var.db_instance_type
  allocated_storage  = 20
  db_name               = var.db_name
  username           = var.db_username
  password           = var.db_password
  db_subnet_group_name = aws_db_subnet_group.mi_subnet_group.name
  vpc_security_group_ids = [var.security_group]

  skip_final_snapshot = true
}
