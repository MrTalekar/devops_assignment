# Configure the AWS Provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = var.acme_access_key
  secret_key = var.acme_secret_key
}


# For EC2 instance we need VPC, create vpc service 

resource "aws_vpc" "acme_demo_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "acme_dev_vpc"
  }
}

resource "aws_subnet" "acme_demo_subnet" {
  vpc_id            = aws_vpc.acme_demo_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "acme_dev_subnet"
  }
}


# Now Create ec2 service

resource "aws_instance" "acme_demo_instance" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.acme_demo_subnet.id
  security_groups = [aws_security_group.acme_demo_sg.name]


  tags = {
    Name = "acme_dev_ec2"
  }
}

# As per assignment create a custom security group for EC2 instance

resource "aws_security_group" "acme_demo_sg" {
  name        = "acme_dev_sg"
  description = "Allow traffic for ec2"
  vpc_id      = aws_vpc.acme_demo_vpc.id

  tags = {
    Name = "acme_dev_sg"
  }


  dynamic "ingress" {
      iterator = port
      for_each = var.acme_ingress
      content {
          from_port = port.value
          to_port = port.value
          protocol = "TCP"
          
        }

    }
      dynamic "egress" {
      iterator = port
      for_each = var.acme_egress
      content {
          from_port = port.value
          to_port = port.value
          protocol = "TCP"
          cidr_blocks = ["0.0.0.0/0"]
        }
    }

  
}