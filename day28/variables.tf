variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-1"
}

variable "ec2_ami_id" {
  default = "ami-0ecaad63ed3668fca"

}
variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "db_instance_type" {
  default = "db.t3.micro"
}

variable "db_name" {
  default = "appdb"
}
variable "db_username" {
  default = "admin"
}
variable "db_password" {
  default = "admin12345"
}
variable "bucket_name" {
  default = "sudarshan-webserver-terraform"
}