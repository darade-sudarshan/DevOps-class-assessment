provider "aws" {
  region  = "us-west-2" # Replace with your desired AWS region
  profile = terraform.workspace
}
# Define the module sources
module "vpc" {
  source                  = "./modules/vpc"
  public_subnet_cidr_ip   = var.public_subnet_cidr_ip
  private_subnet1_cidr_ip = var.private_subnet1_cidr_ip
  private_subnet2_cidr_ip = var.private_subnet2_cidr_ip
  VPC_cidr_ip             = var.VPC_cidr_ip
}

module "ec2" {
  source               = "./modules/ec2"
  instance_type        = var.instance_type
  instance_name        = var.instance_name
  ami                  = var.ami
  tf_key_pair          = var.tf_key_pair
  security_group_id    = module.vpc.security_group_id
  iam_ec2_profile_name = module.iam.ec2_instance_profile
  public_subnet_id     = module.vpc.public_subnet_ids
  environment          = var.environment
}

module "rds" {
  source         = "./modules/rds"
  vpc_id         = module.vpc.vpc_id
  subnet_ids     = module.vpc.aws_db_subnet_group_id
  instance_class = var.instance_class
  engine         = var.engine
  engine_version = var.engine_version
  db_name        = var.db_name
  db_username    = var.db_username
  db_password    = var.db_password
}

module "s3" {
  source           = "./modules/s3"
  bucket_name      = var.bucket_name
  environment      = var.environment
  ec2_iam_role_arn = var.ec2_iam_role_arn
}

module "iam" {
  source                 = "./modules/iam"
  ec2_instance_role_name = var.iam_ec2_profile_name
}

