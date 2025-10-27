# AWS Region
variable "aws_region" {}

#VPC
variable "vpc_cidr_block" {}
variable "vpc_name" {}

#Internet Gateway
variable "internet_gateway_name" {}

# Subnets
variable "subnet1_cidr_block" {}
variable "subnet1_az" {}
variable "subnet1_name" {}

variable "subnet2_cidr_block" {}
variable "subnet2_az" {}
variable "subnet2_name" {}

variable "subnet3_cidr_block" {}
variable "subnet3_az" {}
variable "subnet3_name" {}

# Route Tables
variable "public_route_cidr_block" {}
variable "public_route_table_name" {}

# Security Groups
variable "security_group_name" {}