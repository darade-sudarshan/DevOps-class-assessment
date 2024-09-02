variable "region" {
  type = string
}

# varialbles for EC2 instances
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "instance_name1" {
  description = "Name tag for the EC2 instance"
  type        = string
}
variable "instance_name2" {
  description = "Name tag for the EC2 instance"
  type        = string
}
variable "tf_key_pair" {
  description = "Name of your private key pair"
  type        = string
}

variable "environment" {
  description = "enter value of workspace environment"
  type        = string
}


# variables for s3
# variable "iam_ec2_profile_name" {
#   description = "iam profile name for ec2"
#   type        = string
# }

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

# EC2 IAM Role ARN
variable "ec2_iam_role_arn" {
  description = "The ARN of the IAM role attached to the EC2 instance."
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
variable "private_subnet_cidr_ip" {
  description = "enter value of subnet CIDR IP range"
  type        = string
}