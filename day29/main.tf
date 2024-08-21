provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "sudarshan-terraform-day29"

  tags = {
    Name        = "sudarshan-TerraformStateBucket"
    Environment = "Dev"
  }
}
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "sudarshan-terraform-state-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "sudarshan-TerraformStateLocks"
    Environment = "Dev"
  }
}

module "ec2" {
  source            = "./ec2"
  instance_type     = var.instance_type
  region            = var.region
  availability_zone = var.availability_zone
  vpc_id            = var.vpc_id
  key_name          = var.key_name
  subnet_id         = var.subnet_id
  
}

module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
}