provider "aws" {
  region = var.region
  profile = "user1"
}

#create vpc
module "vpc" {
source                            = "../modules/vpc"
vpc_name                          = var.vpc_name
vpc_cidr_block                    = var.vpc_cidr_block
region                            = var.region
public_subnet_az1_cidr              = var.public_subnet_az1_cidr
public_subnet_az2_cidr              = var.public_subnet_az2_cidr
private_app_subnet_az1_cidr         = var.private_app_subnet_az1_cidr
private_app_subnet_az2_cidr         = var.private_app_subnet_az2_cidr
private_data_subnet_az1_cidr        = var.private_data_subnet_az1_cidr
private_data_subnet_az2_cidr        = var.private_data_subnet_az2_cidr
internet_gateway                    = var.internet_gateway
}

#create ec2 #1
resource "aws_instance" "example" {
  ami           = "ami-09ac7e749b0a8d2a1"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_app_subnet_az1_id
  tags = {
    Name = "my-ec2"
  }
}
#create ec2 #2
resource "aws_instance" "example2" {
  ami           = "ami-09ac7e749b0a8d2a1"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_az1_id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  tags = {
    Name = "my-ec2-2"
  }
}

resource "aws_security_group" "security_group" {
  name        = "my-ec2-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      =  module.vpc.aws_vpc
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}