# Initialize Terraform providers and set their version numbers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 1.5.6"
}

# Provider configuration for AWS
provider "aws" {
  region = var.aws_region
}
