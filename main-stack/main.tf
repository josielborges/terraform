terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "mini-aws-devops-course-remote-backend"
    key            = "main-stack/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "mini-aws-devops-course-remote-backend-locks"
  }
}

provider "aws" {
  region = var.authentication.region

  default_tags {
    tags = var.tags
  }

  assume_role {
    role_arn = var.authentication.assume_role_arn
  }
}