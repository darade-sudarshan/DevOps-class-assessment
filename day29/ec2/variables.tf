variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}
variable "subnet_id" {
  description = "public subnet for ec2 instance"
  type        = string
}
variable "environment" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
  default     = "dev"
}
variable "instance_type_map" {
  description = "Map of instance types by environment"
  type        = map(string)
  default = {
    dev  = "t2.micro"
    prod = "t2.medium"
  }
}