# Deploying a Multi-Tier Web Application Using Amazon ECS (Without Load Balancer and API Gateway)

## Project Overview

This project is designed to test your knowledge and skills in deploying a multi-tier web application using Amazon ECS (Elastic Container Service). The deployment will be conducted without using a Load Balancer or API Gateway. You will need to set up an ECS cluster, define task definitions, create services, and ensure proper networking and security configurations using VPC, subnets, security groups, and IAM roles.

**Estimated Duration:** 2 Hours

## Project Objectives

1. Set up an ECS Cluster using the Fargate launch type.
2. Deploy a web application consisting of multiple containers (frontend and backend).
3. Implement direct communication between frontend and backend services.
4. Manage ECS tasks, services, and scaling policies.
5. Ensure network security with VPC, subnets, security groups, and IAM roles.

## Project Requirements

- **ECS Cluster:** Create an ECS Cluster using Fargate.

[ecs.tf](ecs.tf)

- **Task Definitions:** Define task definitions for web and backend services.
[trontend-task-revision3.json](frontend-task-revision3.json)

[backend-task-revision3.json](backend-task-revision3.json)

- **Services:** Create ECS services for each tier (frontend and backend) without using a Load Balancer or API Gateway.

[ecs-service.tf](ecs-service.tf)

- **Security Groups:** Configure security groups to allow traffic between services directly.

[sec-group.tf](sec-group.tf)

- **IAM Roles:** Create and assign IAM roles for ECS tasks.

[iam-role.tf](iam-role.tf)

- **VPC and Networking:** Create a VPC with public and private subnets, ensuring proper routing of traffic without a NAT gateway.

[vpc.tf](vpc.tf)

- **Secrets Management:** Use AWS Secrets Manager or SSM Parameter Store to manage database credentials.
- **Scaling:** Implement auto-scaling policies for the ECS services.

[auto-scaling.tf](auto-scaling.tf)

## Project Deliverables

### 1. ECS Cluster Setup

- Create an ECS cluster using the Fargate launch type.

![alt text](img/image1.png)

- Ensure the cluster is running in a VPC with public and private subnets.

![alt text](img/image3.png)

### 2. Task Definitions

- Create task definitions for two services:
  - **Frontend Service:** A container running an NGINX server serving static content.

[trontend-task-revision3.json](frontend-task-revision3.json)

  - **Backend Service:** A container running a Python Flask API connected to an RDS instance.
- Define CPU and memory requirements for each container.
- Configure environment variables and secrets for connecting to the database.


[backend-task-revision3.json](backend-task-revision3.json)

### 3. RDS Instance Setup

- Launch an RDS instance using the free tier template with MySQL.

![alt text](img/image2.png)

- Ensure the RDS instance is in a private subnet, accessible only by the backend service.
![alt text](img/image4.png)

- Store database credentials in AWS Secrets Manager or SSM Parameter Store.

![alt text](img/image5.png)

### 4. ECS Services Setup

- Deploy the frontend and backend services using ECS.

![alt text](img/image6.png)

- Ensure that the frontend service can communicate directly with the backend service using the backend service's private IP or DNS name.

### 5. Networking and Security

- Set up VPC with public subnets for the frontend service and private subnets for the backend service and RDS.
- Create security groups to:
  - Allow the frontend service to communicate with the backend service.
  
  ![alt text](img/image7.png)

  - Allow the backend service to connect to the RDS instance.

![alt text](img/image9.png)
  
    - Ensure that the frontend service is accessible from the internet while restricting access to the backend service.
  
  ![alt text](img/image8.png)

- Create IAM roles and policies for ECS tasks to allow access to S3, Secrets Manager, and other required services.

![alt text](img/image10.png)

### 6. Scaling and Monitoring

- Implement auto-scaling policies based on CPU and memory usage for both services.

![alt text](img/image11.png)

![alt text](img/image12.png)

- Set up CloudWatch alarms to monitor service performance and trigger scaling events.

### 7. Deployment and Validation

- Deploy the multi-tier web application using the ECS services.

- Validate the communication between the frontend and backend services.
- Test the application to ensure it functions as expected.

![alt text](img/image13.png)

- Monitor the application’s performance using CloudWatch and other AWS monitoring tools.

### 8. Resource Cleanup

- Once the deployment is validated, ensure that all AWS resources are properly terminated:
  - Stop and delete ECS tasks and services.
  - Delete the ECS cluster.
  - Terminate the RDS instance.
  
  ![alt text](img/image14.png)

  - Clean up any associated S3 buckets, IAM roles, and security groups.
  
[terraform destroy output](destroy.log)