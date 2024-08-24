variable "environment" {
  description = "enter value of workspace environment"
  type        = string
}
# variables for VPC

variable "VPC_cidr_ip" {
  description = "enter value of VPC CIDR IP range"
  type        = string
}
variable "public_subnet_cidr_ip" {
  description = "enter value of subnet CIDR IP range"
  type        = string
}
variable "private_subnet1_cidr_ip" {
  description = "enter value of subnet CIDR IP range"
  type        = string
}
variable "private_subnet2_cidr_ip" {
  description = "enter value of subnet CIDR IP range"
  type        = string
}

# variables for EC2 instance
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}
variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "tf_key_pair" {
  description = "Name of your private key pair"
  type        = string
}

variable "iam_ec2_profile_name" {
  description = "iam profile name for ec2 to access aws resources"
  type        = string
}
# variables for RDS
variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
}
variable "db_name" {
  description = "Name of the RDS database."
  type        = string
}
variable "engine" {
  description = "The engine for the RDS instance."
  type        = string
}
variable "engine_version" {
  description = "The engine version for the RDS instance."
  type        = string
}

variable "db_username" {
  description = "Username for the RDS database."
}

variable "db_password" {
  description = "Password for the RDS database."
  sensitive   = true
}
# variable for s3

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}
# EC2 IAM Role ARN
variable "ec2_iam_role_arn" {
  description = "The ARN of the IAM role attached to the EC2 instance."
  type        = string
}
