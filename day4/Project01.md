                                Project 01
Objectives:

• Create and manage Docker volumes for data persistence.
• Set up a Docker network for container communication.
• Use Docker Compose to manage multi-container applications.
• View and manage Docker logs.
• Deploy the application using Docker Swarm.

Project Outline:

1. Create Docker Volumes
2. Create a Docker Network
3. Write a Docker Compose File
4. Deploy the Application with Docker Compose
5. Manage Docker Logs
6. Deploy the Application Using Docker Swarm

Step-by-Step Guide

1. Create Docker Volumes

Docker volumes are used to persist data generated by and used by Docker containers.

    docker volume create wordpress_data

    docker volume create mysql_data

![alt text](img/image1.png)

2. Create a Docker Network

Create a custom network for the containers to communicate.

    docker network create wordpress_network

![alt text](img/image2.png)

3. Write a Docker Compose File

Create a docker-compose.yml file to define and manage the services.

[docker-compose.yml](Project01/docker-compose.yml)

4. Deploy the Application with Docker Compose

Run the following command to start the services defined in the docker-compose.yml file.

    docker-compose up -d

![alt text](img/image3.png)
	
• Verify that the containers are running.

![alt text](img/image4.png)

    docker-compose ps

![alt text](img/image5.png)

• Access the WordPress setup by navigating to http://localhost:8000.

![alt text](img/image6.png)

5. Manage Docker Logs

View logs for a specific service.

![alt text](img/image7.png)

    docker-compose logs wordpress

• Follow logs for real-time updates.

    docker-compose logs -f wordpress

![alt text](img/image8.png)

6. Deploy the Application Using Docker Swarm

Docker Swarm is a native clustering and orchestration tool for Docker.

• Initialize Docker Swarm.

    docker swarm init

• Convert the Docker Compose file to a Docker Stack file, 

[docker-stack.yml](assessment5/Project01/docker-stack.yml)
 
• Deploy the stack using Docker Swarm.

    docker stack deploy -c docker-stack.yml wordpress_stack

• Verify the stack is running.

    docker stack services wordpress_stack


![alt text](img/image9.png)
