output "vpc_id" {
  value = aws_vpc.ProjectVPC.id
}

output "public_subnet_ids" {
  value = aws_subnet.Project_public_subnet.id
}

output "private_subnet_ids" {
  value = [aws_subnet.Project_private_subnet1.id , aws_subnet.Project_private_subnet2.id]
}
output "security_group_id" {
    value = aws_security_group.ec2_sg_ssh.id
}
output "aws_db_subnet_group_id"{
    value = aws_db_subnet_group.Project_db_subnet.id
  }