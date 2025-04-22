module "vpc" {
  source              = "./modulos/vpc"
  vpc_cidr            = "10.0.0.0/16"
  vpc_name            = "MiVPC"
  subnet_publica_cidr = "10.0.1.0/24"
  subnet_privada_cidr = "10.0.2.0/24"
}

module "security_group_instance" {
  source              = "./modulos/security_group_instance"
  vpc_id              = module.vpc.vpc_id
  security_group_name = "instances-sg"
}
module "ec2" {
  source        = "./modulos/ec2"
  ami_id        = "ami-0e449927258d45bc4"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_publica_id
  security_group_id  = module.security_group_instance.security_group_id
}

module "ec2_ubuntu" {
  source        = "./modulos/ec2Ubuntu"
  ami_id        = "ami-084568db4383264d4"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.subnet_publica_id
  security_group_id  = module.security_group_instance.security_group_id
}

module "ec2_windows" {
  source        = "./modulos/ec2Windows"
  ami_id        = "ami-02e3d076cbd5c28fa"
  instance_type = "t3.large"
  subnet_id     = module.vpc.subnet_publica_id
  security_group_id  = module.security_group_instance.security_group_id
}

module "bucket" {
  source = "./modulos/bucket"
}

output "vpc_id" {
  value = module.vpc.vpc_id
  
}

output "ec2_id" {
  value = module.ec2.instance_id
  
}

output "ec2_id_ubuntu" {
  value = module.ec2_ubuntu.instance_id_ubuntu
}

output "ec_id_windows" {
  value = module.ec2_windows.instance_id_windows
}

