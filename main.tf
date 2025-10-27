terraform {
  backend "s3" {
    bucket = "foodify-bucket-001"
    key    = "support.tfstate"
    region = "us-east-1"
  }
}


# Modules
module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  instance_name = var.instance_name
}
