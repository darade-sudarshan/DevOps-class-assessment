variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}
variable "environment" {
  description = "S3 bucket tag prefix"
  type        = string
  default = "dev"
}