output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.S3_webapp_bucket.arn
}

output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.S3_webapp_bucket.bucket
}

# output "iam_ec2_profile_name" {
#   description = "name of the ec2 instance profle name"
#   value       = aws_iam_instance_profile.ec2_instance_profile.name
# }