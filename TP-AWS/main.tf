terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3  = "http://localhost:4566"
    ec2 = "http://localhost:4566"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "example" {
  name = "example-security-group"

  ingress {
    from_port   = var.security_group_port
    to_port     = var.security_group_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}