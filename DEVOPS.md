# devops_assignmentPhase 2: CI/CD Pipeline
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
=========================================================================================================================================================================================
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
Nexgensis devops assignment

