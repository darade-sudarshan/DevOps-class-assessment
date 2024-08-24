variable "vpc_id" {
  description = "VPC ID where the RDS instance will be launched."
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance."
  type        = string
}

variable "db_username" {
  description = "Username for the RDS database."
}

variable "db_password" {
  description = "Password for the RDS database."
  sensitive   = true
}
variable "instance_class" {
  description = "The instance type of the RDS instance."
  type = string
}
variable "db_name" {
  description = "Name of the RDS database."
  type = string
}
variable "engine" {
  description = "The engine for the RDS instance."
  type = string
}
variable "engine_version" {
  description = "The engine version for the RDS instance."
  type = string
}