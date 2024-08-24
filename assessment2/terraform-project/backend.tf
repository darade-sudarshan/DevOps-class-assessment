# Configure the Terraform backend for state management
terraform {
  backend "s3" {
    bucket         = "sudarshan-terraform-day31-bucket"
    key            = "Global/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
    dynamodb_table = "sudarshan-terraform-state-lock"
    profile        = "dev"
  }
}
