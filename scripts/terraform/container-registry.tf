# Lookup the existing ECR repository
data "aws_ecr_repository" "existing" {
  name = var.container_registry

  # Suppress errors if the repository does not exist
  depends_on = [aws_ecr_repository.ecr]
}

# Create ECR repository only if it doesn't exist
resource "aws_ecr_repository" "ecr" {
  count = length([for repo in try(data.aws_ecr_repository.existing.repository_uri, []): repo]) == 0 ? 1 : 0
  name  = var.container_registry
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

# Output the ECR repository URI, whether it is newly created or already existing
output "ecr_repository_uri" {
  value = coalesce(data.aws_ecr_repository.existing.repository_uri, aws_ecr_repository.ecr[0].repository_url)
}
