
# output "instance_public_ip" {
#   description = "The public IP address of the EC2 instance"
#   value       = aws_instance.webserver.public_ip
# }

# output "bucket_name" {
#   description = "The name of the S3 bucket"
#   value       = aws_s3_bucket.S3_app_bucket.bucket
# }

# output "private_key_pem" {
#   value       = tls_private_key.tf-key.private_key_pem
#   description = "Private key in PEM format"
#   sensitive   = true
# }
