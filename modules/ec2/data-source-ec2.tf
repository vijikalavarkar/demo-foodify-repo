data "aws_subnet" "foodify_public_subnet_1_1a" {
  id = "subnet-0f86ea6020a2486e8"
}

data "aws_security_group" "foodify_security_group" {
  id = "sg-00253303b8cf970d7"
}