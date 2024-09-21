# Create ECR repository for book_catalog
resource "aws_ecr_repository" "book_catalog" {
  name                 = "${var.container_registry}-book_catalog"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.container_registry}-book_catalog"
  }
}

# Create ECR repository for inventory_management
resource "aws_ecr_repository" "inventory_management" {
  name                 = "${var.container_registry}-inventory_management"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.container_registry}-inventory_management"
  }
}
