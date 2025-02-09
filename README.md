# Web Application Deployment with Docker and AWS

## Overview
This project demonstrates how to containerize a web application using Docker and deploy it on AWS with automated scaling and seamless updates.

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

## Deployment Steps
1. **Build and Package the Application**
   ```sh
  chmod +x build_image.sh
  ./build_image.sh 
  docker image ls
   ```
2. **Push the Image to Amazon ECR**
   ```sh
   docker tag rentzone <aws_account_id>.dkr.ecr.<region>.amazonaws.com/rentzone
   aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<region>.amazonaws.com
   docker push <aws_account_id>.dkr.ecr.<region>.amazonaws.com/rentzone
   ```
3. **Deploy to Amazon ECS**
   - Configure an ECS cluster with an Auto Scaling group
   - Define task definitions and services
   - Enable rolling updates for zero-downtime deployments

## Benefits
- **Consistency**: Docker ensures the app runs reliably across different environments.
- **Scalability**: Amazon ECS dynamically adjusts resources based on traffic demands.
- **Efficiency**: Automated deployments and scaling improve operational efficiency.

## Future Enhancements
- Integrate monitoring with AWS CloudWatch
- Implement Blue-Green deployment for enhanced stability



