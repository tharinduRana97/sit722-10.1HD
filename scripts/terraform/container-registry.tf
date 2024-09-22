# Create ECR repository for gateway
resource "aws_ecr_repository" "gateway" {
  name                 = "${var.container_registry}-gateway"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.container_registry}-gateway"
  }
}

# Create ECR repository for history
resource "aws_ecr_repository" "history" {
  name                 = "${var.container_registry}-history"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = "${var.container_registry}-history"
  }
}

  # Create ECR repository for metadata
resource "aws_ecr_repository" "book_catalog" {
  name                 = "${var.container_registry}-metadata"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.container_registry}-metadata"
  }
}

# Create ECR repository for video-streaming
resource "aws_ecr_repository" "video-streaming" {
  name                 = "${var.container_registry}-video-streaming"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.container_registry}-video-streaming"
  }
}

# Create ECR repository for video-upload
resource "aws_ecr_repository" "video-upload" {
  name                 = "${var.container_registry}-video-upload"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.container_registry}-video-upload"
  }
}
