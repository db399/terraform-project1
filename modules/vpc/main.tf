provider "aws" {
  region = var.region
  profile = "user1"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
#   enable_dns_hostnames = true
#   enable_dns_support = true
  tags = {
    Name = var.vpc_name
  }
}