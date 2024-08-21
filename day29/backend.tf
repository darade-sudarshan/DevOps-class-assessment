terraform {
  backend "s3" {
    bucket         = "sudarshan-terraform-day29"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "sudarshan-terraform-state-locks"
    encrypt        = true
  }
}