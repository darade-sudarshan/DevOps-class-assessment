variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default = "t2.micro"
}

variable "region" {
  description = "AWS region"
  type        = string
  default = "us-west-2"
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default = "us-west-2a"
}

variable "vpc_id" {
  description = "VPC ID for the EC2 instance"
  type        = string
  default = "vpc-0ce7e493dd24da8fa"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
  default = "sudarshan-new"
}
variable "subnet_id" {
  description = "public subnet for ec2 instance"
  type        = string
  default = "subnet-0391493f76a59aa14"
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
variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default = "sudarshan-day29-bucket"
}
