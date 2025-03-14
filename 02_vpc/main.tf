provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source         = "./modules/vpc"
  vpc_name       = var.vpc_name
  cidr_block     = var.cidr_block
  public_subnet  = var.public_subnet
  private_subnet = var.private_subnet
}
