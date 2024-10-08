                                    Assessment: Use Case Oriented Project

Project Overview
You are tasked with setting up a CI/CD pipeline for a microservices-based application. The
application will be containerized using Docker and orchestrated using Kubernetes. Ansible
will be used for configuration management and deployment. The entire setup should be
managed using Git for version control, and Jenkins will be used to automate the CI/CD
process.

Assessment Criteria
1. Git:

○ Repository setup
○ Branching strategies
○ Commit and merge practices

2. Jenkins:
○ Pipeline creation using Jenkinsfile
○ Integration with Git
○ Automated build, test, and deployment stages

3. Docker:
○ Dockerfile creation
○ Image building and management
○ Containerization of microservices

4. Kubernetes:
○ Pod and service creation
○ Deployments and replica sets
○ ConfigMaps and Secrets

5. Ansible:
○ Playbook creation
○ Use of variables and templates
○ Inventory management

Use Case Scenario

Your company is developing a new e-commerce application consisting of several
microservices: a front-end service, a product catalog service, and an order processing
service. The goal is to automate the deployment and configuration of these services across
development, testing, and production environments using Ansible, Docker, Kubernetes, and
Jenkins.

Tasks and Deliverables

Task 1: Git Repository Setup
1. Create a Git repository to store all project files, including Ansible playbooks,
Dockerfiles, and Kubernetes manifests.

![alt text](img/image1.png)

![alt text](img/image2.png)

![alt text](img/image3.png)

2. Branching Strategy:

○ Create branches for development, testing, and production.

![alt text](img/image4.png)

![alt text](img/image5.png)

![alt text](img/image6.png)

![alt text](img/image7.png)

○ Implement a strategy for merging changes from development to testing and
production.

![alt text](img/image8.png)

![alt text](img/image9.png)

Task 2: Dockerize Microservices

1. Create Dockerfiles for each microservice (front-end, product catalog, order
processing).

[frontend-Dockerfile](frontend/Dockerfile)

[backend-Dockerfile](backend/Dockerfile)

2. Build Docker images for each microservice and push them to a container registry
(e.g., Docker Hub).

![alt text](img/image10.png)

![alt text](img/image12.png)

![alt text](img/image11.png)

![alt text](img/image13.png)

3. Deliverables:

○ Dockerfiles for each microservice

○ Built Docker images in a container registry

Task 3: Kubernetes Deployment

1. Create Kubernetes manifests for deploying each microservice.

○ Define Pods, Services, Deployments, and ReplicaSets.

[backend-deployment](k8s_manifests/backend-deployment.yaml)

[frontend-deployment](k8s_manifests/frontend-deployment.yaml)

[Mongodb-deployment](k8s_manifests/mongo/deploy.yaml)

[mongodb-service](k8s_manifests/mongo/service.yaml)

[backend-service](k8s_manifests/backend-service.yaml)

[frontend-service](k8s_manifests/frontend-service.yaml)

○ Use ConfigMaps and Secrets for configuration management.

[mongodb-secrets](k8s_manifests/mongo/secrets.yaml)

2. Deploy the microservices to a Kubernetes cluster.

![alt text](img/image14.png)

3. Deliverables:

○ Kubernetes manifests (YAML files)

○ Successful deployment of microservices in the Kubernetes cluster

![alt text](img/image15.png)

![alt text](img/image16.png)

![alt text](img/image17.png)

![alt text](img/image18.png)

Task 4: Ansible Configuration Management

1. Create Ansible playbooks to manage the deployment and configuration of the
microservices.

○ Use variables to handle environment-specific configurations.

○ Utilize Jinja2 templates to dynamically generate configuration files.

2. Set up Ansible inventories to manage different environments (development,
testing, production).

3. Deliverables:

○ Ansible playbooks

○ Ansible inventory files

○ Jinja2 templates for configuration files

Task 5: Jenkins CI/CD Pipeline

1. Set up a Jenkins pipeline using a Jenkinsfile.

![alt text](img/image19.png)

![alt text](img/image20.png)

○ Integrate with Git to trigger the pipeline on code changes.

○ Define stages for building Docker images, pushing them to the registry,
deploying to Kubernetes, and running tests.



![alt text](img/image21.png)

2. Implement error handling and notifications to alert the team on failures.

3. Deliverables:

○ Jenkinsfile defining the CI/CD pipeline

○ Screenshots or logs demonstrating successful pipeline execution
Evaluation Criteria
Participants will be evaluated based on the following:

1. Git:

○ Proper repository setup with clear structure and documentation

○ Effective branching strategy and merge practices

2. Docker:

○ Correct and efficient Dockerfile creation

○ Successful building and pushing of Docker images

3. Kubernetes:

○ Accurate and functional Kubernetes manifests

○ Successful deployment and management of microservices in the cluster

4. Ansible:

○ Well-structured playbooks with proper use of variables and templates

○ Effective inventory management for different environments

5. Jenkins:

○ Comprehensive and functional Jenkins pipeline

○ Proper integration with Git and handling of build, test, and deployment stages

○ Effective error handling and notifications
Submission

Participants should submit the following:

● Git repository URL with all project files

https://github.com/darade-sudarshan/e-commerce-application.git

● Docker Hub repository links to the built images

https://hub.docker.com/r/daradesudarshan/centralrepo/tags

● Screenshots or logs of the Kubernetes deployment

● Jenkins pipeline execution logs or screenshots

● Detailed documentation explaining the setup and configurations

[README.md](README.md)