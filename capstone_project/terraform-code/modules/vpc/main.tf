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
  availability_zone = "ap-northeast-1a"
}
# Create a route table for the public subnet
resource "aws_route_table" "Project_public_rt" {
  vpc_id = aws_vpc.ProjectVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Project_igw.id
  }
}
# Associate the route table with the public subnet
resource "aws_route_table_association" "Project_public_rt_assoc" {
  subnet_id      = aws_subnet.Project_public_subnet.id
  route_table_id = aws_route_table.Project_public_rt.id
}
# Create a private subnet
resource "aws_subnet" "Project_private_subnet" {
  vpc_id                  = aws_vpc.ProjectVPC.id
  cidr_block              = var.private_subnet_cidr_ip
  map_public_ip_on_launch = false
  availability_zone = "ap-northeast-1c"
}
# Create a route table for the private subnet
resource "aws_route_table" "Project_private_rt" {
  vpc_id = aws_vpc.ProjectVPC.id
}
# Associate the route table with the private subnet
resource "aws_route_table_association" "Project_private_rt_assoc" {
  subnet_id      = aws_subnet.Project_private_subnet.id
  route_table_id = aws_route_table.Project_private_rt.id
}
# Create an internet gateway
resource "aws_internet_gateway" "Project_igw" {
  vpc_id = aws_vpc.ProjectVPC.id
  tags = {
    Name = "Sudarshan-IGW"
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
# Create EC2 Security Group for kubernetes controlplane
resource "aws_security_group" "ec2_sg_kubernetes_cp" {
  vpc_id = aws_vpc.ProjectVPC.id
  tags = {
    Name = "Sudarshan-kubernetes-cp-SG"
  }
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ingress traffic to Kubernetes Control Plane on port 6443"
  }
  ingress {
    from_port   = 2379
    to_port     = 2380
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ingress traffic to etcd on ports 2379-2380"
  }
  ingress {
    from_port   = 10250
    to_port     = 10252
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ingress traffic to kube-apiserver on ports 10250-10252"
  }
  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  description  = "Allow ingress traffic to Node port exposing of services"
  }

  ingress {
    from_port   = 10257
    to_port     = 10257
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ingress traffic to kube-scheduler on port 10257"
  }
  ingress {
    from_port   = 10259
    to_port     = 10259
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ingress traffic to kube-controller-manager on port 10259"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
