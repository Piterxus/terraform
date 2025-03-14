provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source         = "./modules/vpc"
  vpc_name       = "MyVPC"
  cidr_block     = "10.0.0.0/16"
  public_subnet  = "10.0.1.0/24"
  private_subnet = "10.0.2.0/24"
}
