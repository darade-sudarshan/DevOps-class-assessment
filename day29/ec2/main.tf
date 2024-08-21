# terraform-modules/aws-infrastructure/main.tf
locals {
  default_instance_type = "t2.micro"
  instance_type = lookup(var.instance_type_map, var.environment, local.default_instance_type)
}
locals {
  tags_list = ["Name", "Environment", "Owner"]
  number_of_tags = length(local.tags_list)
}
resource "aws_instance" "web" {
  
  ami                    = "ami-05134c8ef96964280"
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = join("-", ["web", var.environment, "Instance"])
  }
}

resource "aws_security_group" "web_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
