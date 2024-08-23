variable "region" {
  type    = string
  default = "us-west-2"
}
variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-077aa5b3447e8dc64" #ubuntu version 24.04
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
  description = "iam profile name for ec2"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

# EC2 IAM Role ARN
variable "ec2_iam_role_arn" {
  description = "The ARN of the IAM role attached to the EC2 instance."
  type        = string
}
variable "VPC_cidr_ip" {
  description = "enter value of VPC CIDR IP range"
  type        = string
}
variable "subnet_cidr_ip" {
  description = "enter value of subnet CIDR IP range"
  type        = string
}

variable "environment" {
  description = "enter value of workspace environment"
  type        = string
}
