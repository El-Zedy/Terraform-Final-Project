resource "aws_s3_bucket" "s3_terraform_state" {
  bucket = var.bucket-name
  force_destroy = true
  /* lifecycle {
    prevent_destroy = true
  } */
}
resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = aws_s3_bucket.s3_terraform_state.id
  versioning_configuration {
    status = var.status
  }
}
