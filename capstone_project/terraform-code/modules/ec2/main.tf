# Create EC2 instance for Master controlplane
resource "aws_instance" "k8s_master" {
  ami                         = var.ami
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_ec2_profile_name
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = var.security_group_id
  key_name                    = var.tf_key_pair
  availability_zone           = "ap-northeast-1a"
  tags = {
    Name = var.instance_name1
    Environment= var.environment
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    # private_key = file("/home/einfochips/DevOps-class-assessment/capstone_project/ansible-code/k8s-sudarshan.pem")
    host        = self.public_ip

  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade"
    ]
  }
  provisioner "local-exec" {
    command = "echo 'Ansible Provisioing initiated on ${aws_instance.k8s_master.public_ip}'"
  }
}

# Create EC2 instance
resource "aws_instance" "k8s_worker" {
  ami                         = var.ami
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_ec2_profile_name
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = var.security_group_id
  key_name                    = var.tf_key_pair
  availability_zone           = "ap-northeast-1a"
  tags = {
    Name = var.instance_name2
    Environment= var.environment
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    # private_key = file("/home/einfochips/DevOps-class-assessment/capstone_project/ansible-code/k8s-sudarshan.pem")
    host        = self.public_ip

  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade"
    ]
  }
  provisioner "local-exec" {
    command = "echo 'Ansible Provisioing initiated on ${aws_instance.k8s_worker.public_ip}'"
  }
}