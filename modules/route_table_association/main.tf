resource "aws_route_table_association" "foodify_public_route_table_assocaiation_1" {
  subnet_id      = var.subnet1_id
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "foodify_public_route_table_assocaiation_2" {
  subnet_id      = var.subnet2_id
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "foodify_public_route_table_assocaiation_3" {
  subnet_id      = var.subnet3_id
  route_table_id = var.public_route_table_id
}


