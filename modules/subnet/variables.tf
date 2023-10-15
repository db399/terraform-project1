variable "region" {
  description = "AWS region"
}

variable "vpc_id" {
  description = "ID of the VPC the subnet belongs to"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
}

variable "availability_zone" {
  description = "Availability Zone for the subnet"
}

variable "subnet_name" {
  description = "Name of the subnet"
}
