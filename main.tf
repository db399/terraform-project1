provider "aws" {
  region = "us-west-2"
profile = "user1"
}

module "vpc" {
  source = "./modules/vpc"
  region = "us-west-2"
  vpc_cidr_block = "10.0.0.0/16"
  vpc_name = "my-vpc"
}

# private subnet AZ1
module "subnet" {
  source = "./modules/subnet"
  region = "us-west-2"
  vpc_id = module.vpc.vpc_id
  subnet_cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  subnet_name = "my-private-subnet-AZ1"
}
# private subnet AZ2
module "subnet2" {
  source = "./modules/subnet"
  region = "us-west-2"
  vpc_id = module.vpc.vpc_id
  subnet_cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  subnet_name = "my-private-subnet-AZ2"
}