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
<<<<<<< HEAD
  region  = var.region
  profile = terraform.workspace
=======
  region = var.region
  #profile = terraform.workspace
>>>>>>> refs/remotes/origin/main
}

module "ec2" {
  source               = "./modules/ec2"
  ami                  = var.ami
  instance_type        = var.instance_type
  instance_name1       = var.instance_name1
  instance_name2       = var.instance_name2
  tf_key_pair          = var.tf_key_pair
  public_subnet_id     = module.vpc.ec2_instance_subnet_id
  security_group_id    = [module.vpc.vpc_ec2_sg_id, module.vpc.vpc_ec2_sg_kubernetes_cp_id]
<<<<<<< HEAD
  iam_ec2_profile_name = module.s3.iam_ec2_profile_name
=======
  iam_ec2_profile_name = "ec2-s3-role"
>>>>>>> refs/remotes/origin/main
  environment          = var.environment
}

module "s3" {
  source           = "./modules/s3"
  bucket_name      = var.bucket_name
  ec2_iam_role_arn = var.ec2_iam_role_arn
  environment      = var.environment
}

module "vpc" {
  source                 = "./modules/vpc"
  VPC_cidr_ip            = var.VPC_cidr_ip
  private_subnet_cidr_ip = var.private_subnet_cidr_ip
  public_subnet_cidr_ip  = var.public_subnet_cidr_ip
}
<<<<<<< HEAD
module "iam" {
  source = "./modules/iam"
  ec2_instance_role_name = var.ec2_iam_role_arn
}
=======
# module "iam" {
#   source                 = "./modules/iam"
#   ec2_instance_role_name = var.ec2_iam_role_arn
# }
>>>>>>> refs/remotes/origin/main


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