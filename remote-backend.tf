module "s3-backend" {
  source = "./s3" 
  bucket-name = "s3-bucket-state-010"
  status = "Enabled"
}
module "dynamoDB" {
  source = "./dynamoDB"
  dynamodb-name = "terraform-up-and-running-lock"
  billing_mode = "PAY_PER_REQUEST"
}
terraform {
  backend "s3" {
    bucket = "s3-bucket-state-010"
    key = "dev/terraform.state"
    region = "us-east-2"

    dynamodb_table = "terraform-up-and-running-lock"
    encrypt = true
  }
} 