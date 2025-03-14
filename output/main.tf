terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_instance" "mi_ec2" {
  ami           = "ami-0ac4dfaf1c5c0cce9"
  instance_type = "t2.micro"
#   subnet_id     = aws_subnet.mi_subnet.id
  key_name      = "vockey"
  tags = {
    Name = "tf-mi_ec2"
  }
}

output "public_ip" {
  description = "value of the public IP"
  value = aws_instance.mi_ec2.public_ip

  
}