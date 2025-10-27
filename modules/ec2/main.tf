resource "aws_instance" "demo_foodify_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id     = data.aws_subnet.foodify_public_subnet_1_1a.id
  vpc_security_group_ids = [ data.aws_security_group.foodify_security_group.id ]
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}