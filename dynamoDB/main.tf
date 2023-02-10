resource "aws_dynamodb_table" "terraform_lock" {
  name             = var.dynamodb-name
  billing_mode     = var.billing_mode
  hash_key         = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}