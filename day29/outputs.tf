output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.terraform_state.bucket
}
output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}
output "region" {
  description = "The AWS region"
  value       = var.region
}
