# AWS Region
aws_region = "us-east-1"

# VPC
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "foodify_vpc_prod"

#Internet Gateway
internet_gateway_name = "foodify_internet_gateway_prod"

# Subnets
subnet1_cidr_block = "10.0.1.0/24"
subnet1_az         = "us-east-1a"
subnet1_name       = "foodify_public_subnet_1_1a_prod"

subnet2_cidr_block = "10.0.2.0/24"
subnet2_az         = "us-east-1a"
subnet2_name       = "foodify_public_subnet_2_1a_prod"

subnet3_cidr_block = "10.0.3.0/24"
subnet3_az         = "us-east-1b"
subnet3_name       = "foodify_public_subnet_3_1b_prod"

# Route Tables
public_route_cidr_block = "0.0.0.0/0"
public_route_table_name = "foodify_public_route_table_prod"

# Security Groups
security_group_name = "foodify_security_group_prod"

# EC2
ami_id = "ami-0bbdd8c17ed981ef9"
instance_type = "t3.micro"
key_name = "ansibleKey"
instance_name = "demo_foodify_server_prod"


# DynamoDB
dynamodb_table_name = "foodify_terraform_locks_prod"
billing_mode = "PAY_PER_REQUEST"
hash_key = "LockID"
