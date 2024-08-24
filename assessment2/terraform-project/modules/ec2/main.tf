# Create EC2 instance
resource "aws_instance" "webserver" {
  ami                        = var.ami
  instance_type               = var.instance_type
  iam_instance_profile        = var.iam_ec2_profile_name
  # associate_public_ip_address = true
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.tf_key_pair
  tags = {
    Name = var.instance_name
    Environment= var.environment
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/einfochips/secrets/sudarshan-tf-key-pair.pem.pem")
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
  lifecycle {
    prevent_destroy = true
  }
}
# Create Elastic IP for EC2 instance
resource "aws_eip" "webserver_eip" {
  domain = "vpc"
  instance = aws_instance.webserver.id
}
#create Elastip IP association with EC2 instance
resource "aws_eip_association" "webserver_eip_assoc" {
  instance_id   = aws_instance.webserver.id
  allocation_id = aws_eip.webserver_eip.id
}
