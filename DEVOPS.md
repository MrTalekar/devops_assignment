Phase1: Containerization

1.	I was given a full-stack Hello World application with a Django REST backend and a React frontend.
2.	My task was to containerize both applications using Docker, follow DevOps best practices, and run them together using Docker Compose.
3.	I used multi-stage Docker builds for both frontend and backend to keep images small and secure.
4.	For Django, I used a Python slim image, installed dependencies via requirements.txt, and ran the app as a non-root user.
5.	For React, I built the app using Node.js and served the static build using the official nginx-unprivileged image, which allows Nginx to run as a non-root user without permission issues.
6.	Both containers run as non-root users, which is a security best practice.
7.	I avoided hardcoded configuration and externalized all environment-specific values.
8.	I used environment variables for configuration:
9.	Django reads DEBUG and ALLOWED_HOSTS from the environment
10.	React reads the backend URL via VITE_API_URL
11.	This allowed the frontend to communicate with the backend using the Docker service name (http://backend:8000) instead of hardcoded localhost values.
12.	I used Docker Compose to orchestrate both services.
13.	Compose handles service startup, networking, port mapping, and environment variables.
14.	The frontend depends on the backend and accesses it through Docker’s internal DNS.


Phase 2: CI/CD Pipeline
1.	This workflow automates the containerization process for the application. Whenever code is pushed to the repo, the workflow builds a Docker image for Dockerfile and pushes to Docker Hub.
2.	For set-up the workflow you need to write simple Dockerfile. After that create a workflow in your repository that automatically triggers a series of commands whenever code is pushed.
3.	 In the text editor area, write the content of your Dockerfile. You can either type it directly or copy and paste it from your local file
4.	Some workflow templates use secrets. For example,                                                              ${{ secrets.npm_token }}. If the workflow uses a secret, store the value described in the secret name as a secret in your repository.
•	Configure your Secrets/Variables with GitHub repository.
•	Open your repository's Settings.
•	Under Security, go to Secrets and variables > Actions.
•	Under Secrets, create a new repository secret named DOCKER_PASSWORD, containing your Docker access token.
•	Next, under Variables, create a DOCKER_USERNAME repository variable containing your Docker Hub username.
5.	Set up your GitHub Actions workflow.
•	Create a file named main.yml in the. github/workflows/ directory of your repository.
•	Write the code for workflow.
6.	Push Your Code or commit your changes and Trigger the Workflow.
Automate the deployment to our [ local] environment  
•	In your workflow file in job [ runs-on: self-hosted] made that changes.
•	Configure your self-hosted server via following procedure 
	In the git setting click on Actions. From the Action tab select the Runners option.
	Add new self-hosted runner requires that you download, configure, and execute the GitHub Actions Runner.
	After completing the steps to add a self-hosted runner, the runner and its status are now listed under "Runners".




Phase 3: Infrastructure as Code [ Terraform]
1.	Terraform is an infrastructure as code tool that lets you build, change, and version infrastructure safely and efficiently.
2.	For our task we need to create a EC2 instance for AWS cloud.
3.	To launch a instance we need cloud provider, Resource block of ec2 instance and variable/outputs.
4.	Create three files for terraform 1. main.tf, 2. var.tf and 3. output.tf. output.tf file is optional choice.
5.	In the main.tf set up the AWS cloud provider. Cloud provider is a plugin that enables terraform to interact with specific cloud provider or cloud service.
6.	Configure Resource block of EC2 instance. Terraform Resources is a representation of a specific infrastructure component.
7.	Set up the terraform variables in var.tf. This file used for variables values allowing you to separate the sensitive information or data from your main configuration.
8.	Terraform also provide the template for resource block https://registry.terraform.io/providers/hashicorp/aws
9.	With the help of terraform registry you can write the code for any cloud services.

Challenges:
	The main challenge was running Nginx as a non-root user.
	Instead of modifying root-owned directories, I solved this cleanly by using the nginx-unprivileged image, which is designed for secure, non-root execution.
	For resolving this issue I used nginx unprivileged image.
FROM nginxinc/nginx-unprivileged:alpine
