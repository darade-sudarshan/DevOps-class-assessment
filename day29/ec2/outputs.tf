output "ec2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}
output "region" {
  description = "The AWS region"
  value       = var.region
}
output "tag_count" {
  value = local.number_of_tags
}