                            Project: Deploying a Multi-Tier Architecture Application using CloudFormation

# Project Objective:
This project will test your ability to deploy a multi-tier architecture application using AWS CloudFormation. The deployment should include an EC2 instance, an S3 bucket, a MySQL DB instance in RDS, and a VPC, all within the specified constraints.

# Project Overview:

You are required to design and deploy a multi-tier application using AWS CloudFormation. The architecture will include the following components:
EC2 Instance: Serve as the web server.
S3 Bucket: Store static assets or configuration files.
RDS MySQL DB Instance: Serve as the database backend.
VPC: Ensure secure communication between the components.

# Specifications:

EC2 Instance: Use a t2.micro instance type, located in the public subnet, with SSH access allowed from a specific IP range.

RDS MySQL DB Instance: Use a t3.micro instance type, located in a private subnet.

S3 Bucket: Use for storing configuration files or assets for the web server.

VPC: Create a VPC with public and private subnets. No NAT Gateway or Elastic IP should be used. Internet access for the EC2 instance should be provided via an Internet Gateway attached to the VPC.

CloudFormation Template: Participants must create a CloudFormation template to automate the deployment process.

Allowed Regions: Deployment is restricted to the regions us-east-1, us-east-2, us-west-1, and us-west-2.

# Key Tasks:

Create a CloudFormation Template:

VPC and Subnets:

Define a VPC with one public and one private subnet.
Attach an Internet Gateway to the VPC for public subnet access.

![alt text](img/image6.png)

Security Groups:

Create a security group for the EC2 instance, allowing SSH and HTTP access from a specific IP range.

![alt text](img/image8.png)

Create a security group for the RDS instance, allowing MySQL access from the EC2 instance only.

![alt text](img/image9.png)

![alt text](img/image7.png)

EC2 Instance:

Launch a t2.micro EC2 instance in the public subnet.
Configure the instance to access the S3 bucket and connect to the RDS instance.

![alt text](img/image11.png)

S3 Bucket:

Create an S3 bucket for storing static assets or configuration files.
Ensure the EC2 instance has the necessary IAM role and permissions to access the S3 bucket.

![alt text](img/image14.png)

![alt text](img/image15.png)

RDS MySQL DB Instance:

Launch a t3.micro MySQL database in the private subnet.
Configure the security group to allow access only from the EC2 instance.

![alt text](img/image12.png)

![alt text](img/image13.png)

![alt text](img/image18.png)

Deploy the Application:

Deploy the CloudFormation stack using the template created.

![alt text](img/image1.png)
![alt text](img/image2.png)
![alt text](img/image3.png)
![alt text](img/image4.png)
![alt text](img/image5.png)
![alt text](img/image10.png)

Verify that all components are correctly configured and operational.

Ensure the EC2 instance can communicate with the RDS instance and access the S3 bucket.

![alt text](img/image16.png)
![alt text](img/image17.png)

Deliverables:

CloudFormation Template: A complete template file (.yaml or .json) used for deployment.
Deployment Documentation: Detailed documentation covering the deployment steps, design decisions, and testing process.

[Stack-Deploy.yaml](Stack-Deploy.yaml)

Test Results: Evidence of successful deployment and testing, including screenshots or logs.

Cleanup Confirmation: Confirmation that all resources have been terminated and no charges will continue to accrue.

![alt text](img/image19.png)

![alt text](img/image20.png)

