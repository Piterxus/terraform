module "vpc" {
  source              = "./modulos/vpc"
  vpc_cidr            = "10.0.0.0/16"
  vpc_name            = "MiVPC"
  subnet_publica_cidr = "10.0.1.0/24"
  subnet_privada_cidr = "10.0.2.0/24"
}
module "ec2" {
  source        = "./modulos/ec2"
  ami_id        = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_publica_id
}

module "ec2_ubuntu" {
  source        = "./modulos/ec2Ubuntu"
  ami_id        = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_publica_id
}



output "vpc_id" {
  value = module.vpc.vpc_id
  
}

output "ec2_id" {
  value = module.ec2.instance_id
  
}