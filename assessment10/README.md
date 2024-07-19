
                                                                    **Project Overview**
                                                                    
Participants are required to deploy a simple static web application on a Kubernetes cluster using Minikube, set up advanced ingress networking with URL rewriting and sticky sessions, and configure horizontal pod autoscaling to manage traffic efficiently. The project will be divided into stages, with each stage focusing on specific aspects of Kubernetes ingress, URL rewriting, sticky sessions, and autoscaling.

Requirements and Deliverables

Stage 1: Setting Up the Kubernetes Cluster and Static Web App
    1 Set Up Minikube:
        ◦ Ensure Minikube is installed and running on the local Ubuntu machine.
        ◦ Verify the Kubernetes cluster is functioning correctly.

          ![image](https://github.com/user-attachments/assets/ad735fbd-ec30-4bda-83a5-0bcdb739a4ab)

    2 Deploy Static Web App:
        ◦ Create a Dockerfile for a simple static web application (e.g., an HTML page served by Nginx).
           
           ![image](https://github.com/user-attachments/assets/d5ed6863-bcc6-4bd0-b1d5-6e16bb1bfe12)

        ◦ Build a Docker image for the static web application.
        ◦ Push the Docker image to Docker Hub or a local registry.
    3 Kubernetes Deployment:
        ◦ Write a Kubernetes deployment manifest to deploy the static web application.
          
        ◦ Write a Kubernetes service manifest to expose the static web application within the cluster.
        ◦ Apply the deployment and service manifests to the Kubernetes cluster.
          
          ![image](https://github.com/user-attachments/assets/2357e628-f1b9-4ae3-8d46-0a2587e161ed)

Deliverables:
    • Dockerfile for the static web app
    • Docker image URL
    • Kubernetes deployment and service YAML files
    
Stage 2: Configuring Ingress Networking
    
    4 Install and Configure Ingress Controller:
        ◦ Install an ingress controller (e.g., Nginx Ingress Controller) in the Minikube cluster.
        ◦ Verify the ingress controller is running and accessible.
          
          ![image](https://github.com/user-attachments/assets/d7afa967-ede5-407f-93f5-09d72ce26db9)

    5 Create Ingress Resource:
        ◦ Write an ingress resource manifest to route external traffic to the static web application.
        ◦ Configure advanced ingress rules for path-based routing and host-based routing (use at least two different hostnames and paths).

        ![image](https://github.com/user-attachments/assets/cd308b5e-5bb8-4628-97cd-0d7e867f4cc0)

          
        ◦ Implement TLS termination for secure connections.

        ![image](https://github.com/user-attachments/assets/574a8d2e-9bd2-423b-a8c6-977b61f430d9)

          
        ◦ Configure URL rewriting in the ingress resource to modify incoming URLs before they reach the backend services.
          
        ◦ Enable sticky sessions to ensure that requests from the same client are directed to the same backend pod.

        ![image](https://github.com/user-attachments/assets/196c474d-b65d-4d02-84a8-4c1d39cab52f)


Deliverables:
    • Ingress controller installation commands/scripts
    • Ingress resource YAML file with advanced routing, TLS configuration, URL rewriting, and sticky sessions
    
Stage 3: Implementing Horizontal Pod Autoscaling
    6 Configure Horizontal Pod Autoscaler:
        ◦ Write a horizontal pod autoscaler (HPA) manifest to automatically scale the static web application pods based on CPU utilization.
        ◦ Set thresholds for minimum and maximum pod replicas.
          ![image](https://github.com/user-attachments/assets/27226e61-38ab-41e2-a119-fc5785ddbac3)

    7 Stress Testing:
        ◦ Perform stress testing to simulate traffic and validate the HPA configuration.
        ◦ Monitor the scaling behavior and ensure the application scales up and down based on the load.

        Stress test output for frontend deployments :
        ![image](https://github.com/user-attachments/assets/0ae89a38-fcda-424b-b8c8-a6db02eebc10)

        Stress test output for backend deployments :
        
        ![image](https://github.com/user-attachments/assets/8e396d8e-500b-415b-9ca2-3ceebdf5ee97)
        
        output afer cooldown period :
        
        ![image](https://github.com/user-attachments/assets/43ee1a9e-309b-40c8-9808-d164ff365681)


Deliverables:
    • Horizontal pod autoscaler YAML file
    • Documentation or screenshots of the stress testing process and scaling behavior
Stage 4: Final Validation and Cleanup
    8 Final Validation:
        ◦ Validate the ingress networking, URL rewriting, and sticky sessions configurations by accessing the web application through different hostnames and paths.
          
          ![image](https://github.com/user-attachments/assets/b905dda8-0112-4a71-af52-59f0c3c90d6f)

        ◦ Verify the application's availability and performance during different load conditions.

       
       9.Cleanup:
        ◦ Provide commands or scripts to clean up the Kubernetes resources created during the project (deployments, services, ingress, HPA).

        kubectl delete deployment frontend
        kubectl delete deployment backend
        kubectl delete deployment frontend-service
        kubectl delete deployment backend-service
        kubectl delete hpa backend
        kubectl delete hpa frontend
Deliverables:
    • Final validation report documenting the testing process and results
    • Cleanup commands/scripts
