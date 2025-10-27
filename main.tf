terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket = "foodify-bucket-001"
    key    = "foodify.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = var.aws_region
}

# Modules

# VPC
module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name
}

# Internet Gateway
module "internet_gateway" {
  source                       = "./modules/internet_gateway"
  vpc_id                       = module.vpc.vpc_id
  internet_gateway_name        = var.internet_gateway_name
}

# Subnets
module "subnets" {
  source             = "./modules/subnets"
  vpc_id             = module.vpc.vpc_id
  subnet1_cidr_block = var.subnet1_cidr_block
  subnet1_az         = var.subnet1_az
  subnet1_name       = var.subnet1_name
  subnet2_cidr_block = var.subnet2_cidr_block
  subnet2_az         = var.subnet2_az
  subnet2_name       = var.subnet2_name
  subnet3_cidr_block = var.subnet3_cidr_block
  subnet3_az         = var.subnet3_az
  subnet3_name       = var.subnet3_name
}

# Route Tables
module "route_tables" {
  source                  = "./modules/route_tables"
  vpc_id                  = module.vpc.vpc_id
  internet_gateway_id     = module.internet_gateway.internet_gateway_id
  public_route_cidr_block = var.public_route_cidr_block
  public_route_table_name = var.public_route_table_name
}

# Route Table Associations
module "route_table_associations" {
  source                = "./modules/route_table_association"
  subnet1_id            = module.subnets.subnet1_id
  subnet2_id            = module.subnets.subnet2_id
  subnet3_id            = module.subnets.subnet3_id
  public_route_table_id = module.route_tables.public_route_table_id
}

# Security Groups
module "security_groups" {
  source              = "./modules/security_groups"
  vpc_id              = module.vpc.vpc_id
  security_group_name = var.security_group_name
}

# EC2
module "ec2" {
  source              = "./modules/ec2"
  ami_id              = var.ami_id
  instance_type       = var.instance_type
  key_name            = var.key_name
  instance_name       = var.instance_name
  subnet1_id          = module.subnets.subnet1_id
  security_group_id   = module.security_groups.security_group_id
}


# DynamoDB
module "dynamodb" {
  source              = "./modules/dynamodb"
  dynamodb_table_name = var.dynamodb_table_name
  billing_mode        = var.billing_mode
  hash_key            = var.hash_key
}