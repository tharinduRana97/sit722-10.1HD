# Check if the ECR repository already exists
data "aws_ecr_repository" "existing" {
  name = var.container_registry
}

# Determine whether the ECR repository needs to be created
locals {
  ecr_repository_exists = length(try([data.aws_ecr_repository.existing.repository_url], [])) > 0
}

# Create ECR repository only if it doesn't exist
resource "aws_ecr_repository" "ecr" {
  count = local.ecr_repository_exists ? 0 : 1
  name  = var.container_registry
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

