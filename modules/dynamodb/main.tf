resource "aws_dynamodb_table" "foodify_terraform_locks" {
  name         = var.dynamodb_table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key

  attribute {
    name = "LockID"
    type = "S"
  }
}