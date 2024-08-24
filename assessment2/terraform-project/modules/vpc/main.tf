# Create VPC, subnets, and security groups
resource "aws_vpc" "ProjectVPC" {
  cidr_block = var.VPC_cidr_ip
  tags = {
    Name = "Sudarshan-VPC"
  }
}
# Create a public subnet
resource "aws_subnet" "Project_public_subnet" {
  vpc_id                  = aws_vpc.ProjectVPC.id
  cidr_block              = var.public_subnet_cidr_ip
  map_public_ip_on_launch = true
  availability_zone = "us-west-2a"
}
# Create a private subnet
resource "aws_subnet" "Project_private_subnet1" {
  vpc_id     = aws_vpc.ProjectVPC.id
  cidr_block = var.private_subnet1_cidr_ip
  availability_zone = "us-west-2a"
}
resource "aws_subnet" "Project_private_subnet2" {
  vpc_id     = aws_vpc.ProjectVPC.id
  cidr_block = var.private_subnet2_cidr_ip
  availability_zone = "us-west-2b"
}
# Create an internet gateway
resource "aws_internet_gateway" "Project_igw" {
  vpc_id = aws_vpc.ProjectVPC.id
  tags = {
    Name = "Sudarshan-IGW"
  }
}
# Create a route table for the public subnet
resource "aws_route_table" "Project_public_rt" {
  vpc_id = aws_vpc.ProjectVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Project_igw.id
  }
}
# Create a route table for the private subnet
resource "aws_route_table" "Project_private_rt" {
  vpc_id = aws_vpc.ProjectVPC.id
}
# Associate the route table with the public subnet
resource "aws_route_table_association" "Project_public_rt_assoc" {
  subnet_id      = aws_subnet.Project_public_subnet.id
  route_table_id = aws_route_table.Project_public_rt.id
}

# Associate the route table with the private subnets
resource "aws_route_table_association" "Project_private_rt_assoc1" {
  subnet_id      = aws_subnet.Project_private_subnet1.id
  route_table_id = aws_route_table.Project_private_rt.id
}
resource "aws_route_table_association" "Project_private_rt_assoc2" {
  subnet_id      = aws_subnet.Project_private_subnet2.id
  route_table_id = aws_route_table.Project_private_rt.id
}
#create subnet group for RDS instance
resource "aws_db_subnet_group" "Project_db_subnet" {
  name       = "sudarsahan-db-subnet"
  subnet_ids = [aws_subnet.Project_private_subnet1.id, aws_subnet.Project_private_subnet2.id]

  tags = {
    Name = "Sudarshan-DB-Subnet-Group"
  }
}
# Create EC2 Security Group
resource "aws_security_group" "ec2_sg_ssh" {
  vpc_id = aws_vpc.ProjectVPC.id
  tags = {
    Name = "Sudarshan-ec2-ssh-SG"
  }
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
# Create RDS Security Group
resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.ProjectVPC.id
  tags = {
    Name = "Sudarshan-RDS-SG"
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.ec2_sg_ssh.id]
  }
}

