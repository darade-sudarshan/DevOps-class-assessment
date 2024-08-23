terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "local" {
    path = "terrform.tfstate.d/dev"
  }
}

provider "aws" {
  region  = var.region
  profile = terraform.workspace
}

module "ec2" {
  source               = "./modules/ec2"
  ami                  = var.ami
  instance_type        = var.instance_type
  instance_name        = var.instance_name
  tf_key_pair          = var.tf_key_pair
  public_subnet_id     = module.vpc.ec2_instance_subnet_id
  security_group_id    = module.vpc.vpc_ec2_sg_id
  iam_ec2_profile_name = module.s3.iam_ec2_profile_name
  environment          = var.environment
}

module "s3" {
  source           = "./modules/s3"
  bucket_name      = var.bucket_name
  ec2_iam_role_arn = var.ec2_iam_role_arn
  environment      = var.environment
}

module "vpc" {
  source         = "./modules/vpc"
  VPC_cidr_ip    = var.VPC_cidr_ip
  subnet_cidr_ip = var.subnet_cidr_ip
}

# resource "aws_key_pair" "tf_key_pair" {
#   key_name   = var.tf_key_pair
#   public_key = tls_private_key.rsa.public_key_openssh
# }
# resource "tls_private_key" "rsa" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }
# # resource "local_file" "tf_key" {
# #   content  = tls_private_key.rsa.private_key_pem
# #   filename = "sudarshan-tf-key-pair.pem"
# # }