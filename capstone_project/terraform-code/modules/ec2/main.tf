# Create EC2 instance for Master controlplane
resource "aws_instance" "k8s_master" {
  ami                         = var.ami
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_ec2_profile_name
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = var.security_group_id
  key_name                    = var.tf_key_pair
<<<<<<< HEAD
  availability_zone           = "us-west-2a"
=======
  availability_zone           = "ap-northeast-1a"
>>>>>>> refs/remotes/origin/main
  tags = {
    Name = var.instance_name1
    Environment= var.environment
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
<<<<<<< HEAD
    # private_key = file("/home/aarya/DevOps-class-assessment/capstone_project/ansible-code/ansible-worker-us-west-2.pem")
=======
    # private_key = file("/home/einfochips/DevOps-class-assessment/capstone_project/ansible-code/k8s-sudarshan.pem")
>>>>>>> refs/remotes/origin/main
    host        = self.public_ip

  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade"
    ]
  }
  provisioner "local-exec" {
<<<<<<< HEAD
    command = "echo 'Apache installation initiated on ${aws_instance.k8s_master.public_ip}'"
=======
    command = "echo 'Ansible Provisioing initiated on ${aws_instance.k8s_master.public_ip}'"
>>>>>>> refs/remotes/origin/main
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
<<<<<<< HEAD
  availability_zone           = "us-west-2a"
=======
  availability_zone           = "ap-northeast-1a"
>>>>>>> refs/remotes/origin/main
  tags = {
    Name = var.instance_name2
    Environment= var.environment
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
<<<<<<< HEAD
    # private_key = file("/home/aarya/DevOps-class-assessment/capstone_project/ansible-code/ansible-worker-us-west-2.pem")
=======
    # private_key = file("/home/einfochips/DevOps-class-assessment/capstone_project/ansible-code/k8s-sudarshan.pem")
>>>>>>> refs/remotes/origin/main
    host        = self.public_ip

  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade"
    ]
  }
  provisioner "local-exec" {
<<<<<<< HEAD
    command = "echo 'Apache installation initiated on ${aws_instance.k8s_worker.public_ip}'"
=======
    command = "echo 'Ansible Provisioing initiated on ${aws_instance.k8s_worker.public_ip}'"
>>>>>>> refs/remotes/origin/main
  }
}