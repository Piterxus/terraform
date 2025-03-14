terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuro el AWS Provider
# aws como proveedor solo nos pide la region
provider "aws" {
  region = "us-east-1"
}

# Crear VPC
resource "aws_vpc" "mi_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "tf-mi_vpc"
  }
}

#Creamos la subnet
resource "aws_subnet" "mi_subnet" {
  vpc_id            = aws_vpc.mi_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "tf-mi_subred"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mi_vpc.id

  tags = {
    Name = "main"
  }
}

# Asociar la gateway a la VPC
resource "aws_internet_gateway_attachment" "gw_attach" {
  vpc_id              = aws_vpc.mi_vpc.id
  internet_gateway_id = aws_internet_gateway.gw.id
}

# Crear una tabla de rutas
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.mi_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "main"
  }
}

# Asociar la tabla de rutas a la subred

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.mi_subnet.id
  route_table_id = aws_route_table.rt.id
}




# Crear ec2
resource "aws_instance" "mi_ec2" {
  ami                    = "ami-0ac4dfaf1c5c0cce9" # us-east-1
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.mi_subnet.id # Asignar la subred
  vpc_security_group_ids = [aws_security_group.gs_migrupo.id]
  associate_public_ip_address = true
  user_data              = <<-EOF
        #!/bin/bash
        # Actualizar el sistema
        yum update -y
        # Instalar Apache (httpd)
        yum install -y httpd
        # Habilitar y iniciar el servicio Apache
        systemctl enable httpd
        systemctl start httpd
        # Crear una página de prueba en el directorio raíz de Apache
        echo "<html><body><h1>¡Hola, mundo! Esto es una página de prueba.</h1><p>Instancia EC2 con Amazon Linux y Apache.</p></body></html>" > /var/www/html/index.html
        # Ajustar los permisos del archivo de la página de prueba
        chmod 644 /var/www/html/index.html
        # Reiniciar Apache para asegurar que los cambios se apliquen
        systemctl restart httpd  
        EOF

  tags = {
    Name = "tf-mi_ec2"
  }
}

resource "aws_security_group" "gs_migrupo" {
  name = "mi_gs"
  vpc_id = aws_vpc.mi_vpc.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso al puerto 80 desde el exterior"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
  }

}
