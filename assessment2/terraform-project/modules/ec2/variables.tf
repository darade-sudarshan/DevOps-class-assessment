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
  type = string
  default = "my-ansible-worker"
}

variable "iam_ec2_profile_name" {
  description = "iam profile name for ec2 to access aws resources"
  type = string
}

variable "public_subnet_id" {
  description = "public subnet id for ec2"
  type = string
}

variable "security_group_id" {
  description = "security group id for ec2"
  type = string
}
variable "environment" {
    description = "enter value of workspace environment"
    type = string
}
