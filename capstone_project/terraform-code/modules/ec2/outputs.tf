output "instance1_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.k8s_master.id
}

output "instance1_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.k8s_master.public_ip
}

output "instance2_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.k8s_worker.id
}

output "instance2_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.k8s_worker.public_ip
}
