# Create EC2 instance
resource "aws_instance" "webserver" {
  ami                         = var.ami
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_ec2_profile_name
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.tf_key_pair
  availability_zone           = "us-west-2a"
  tags = {
    Name = var.instance_name
    Environment= var.environment
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    # private_key = file("/home/einfochips/DevOps-class-assessment/day30/aws_infrastructure/sudarshan-tf-key-pair.pem")
    host        = self.public_ip

  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]
  }
  provisioner "local-exec" {
    command = "echo 'Apache installation initiated on ${aws_instance.webserver.public_ip}'"
  }
}

