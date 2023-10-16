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