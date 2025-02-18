# Theer Tier Web Application Deployment with Docker and ECS

## Overview
This project demonstrates how to containerize a web application using Docker and deploy it on AWS with automated scaling and seamless updates.

This project also leverages Terraform to automate the provisioning and management of cloud infrastructure. It simplifies resource deployment, ensures consistency, and enhances scalability. You can find the Terraform configuration files in the following repository: [Terraform Project Repository](https://github.com/li-zhang1/rentzone-terraform-ecs-project)

This project also leverages Terraform Modules to automate the infrastructure deployment. The Terraform repository is [here](https://github.com/li-zhang1/rentzone-infrastructure-ecs)

## Features
- **Dockerized Application**: Built and packaged a web application using Docker to ensure consistency across environments and reduce setup time from hours to minutes.
- **Amazon ECR Integration**: Utilized Amazon Elastic Container Registry (ECR) for secure storage and easy sharing of Docker images among team members.
- **Scalable Deployment with Amazon ECS**: Configured Amazon Elastic Container Service (ECS) with automatic scaling to handle varying traffic loads, dynamically adding or removing resources as needed.
- **Zero-Downtime Deployment**: Implemented a rolling deployment strategy to release new versions without service interruptions, improving user experience and reliability.

## Technologies Used
- Docker
- Amazon Elastic Container Registry (ECR)
- Amazon Elastic Container Service (ECS)
- AWS Auto Scaling

## 🚀 Deployment Steps

### **1️⃣ Build and Package the Application**
Ensure the build script is executable and build the Docker image:
```sh
chmod +x build_image.sh
./build_image.sh
docker image ls
```

---

### **2️⃣ Push the Image to Amazon ECR**
Tag the image and push it to your Amazon Elastic Container Registry (ECR):
```sh
docker tag rentzone <aws_account_id>.dkr.ecr.<region>.amazonaws.com/rentzone

aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com

docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/rentzone
```

---

### **3️⃣ Deploy to Amazon ECS**
1. **Configure an ECS Cluster:**
   - Create an ECS cluster with the desired compute options (EC2 or Fargate).
   - Set up an Auto Scaling group to manage the cluster instances.

2. **Define Task Definitions and Services:**
   - Create an ECS task definition specifying container configurations.
   - Define an ECS service to manage task scheduling and load balancing.

3. **Enable Rolling Updates:**
   - Configure ECS service deployment strategies to support rolling updates.
   - Ensure zero-downtime deployments by gradually replacing old tasks with new ones.

## Benefits
- **Consistency**: Docker ensures the app runs reliably across different environments.
- **Scalability**: Amazon ECS dynamically adjusts resources based on traffic demands.
- **Efficiency**: Automated deployments and scaling improve operational efficiency.

## Future Enhancements
- Integrate monitoring with AWS CloudWatch
- Implement Blue-Green deployment for enhanced stability



