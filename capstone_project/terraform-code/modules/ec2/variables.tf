variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-077aa5b3447e8dc64"  #ubuntu version 24.04
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
  type = string
}

variable "iam_ec2_profile_name" {
  description = "iam profile name for ec2"
  type = string
}
variable "security_group_id" {
  description = "Security group ID for the EC2 instance"
  type        = list(string)
}
variable "public_subnet_id" {
  description = "public subnit id for ec2"
  type = string
}

variable "environment" {
    description = "enter value of workspace environment"
    type = string
}
