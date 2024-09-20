# Create an ECR repository
resource "aws_ecr_repository" "ecr" {
  name                 = var.container_registry
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}
