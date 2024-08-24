output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.webserver.public_ip
}

output "ec2_instance_ids" {
  value = aws_instance.webserver.id
}

# output for elastic ip of ec2 instance
output "webserver_eip_public_ip"{
  value = aws_eip.webserver_eip.public_ip
}