# outputs.tf

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

# Output the repository URL for book_catalog
output "book_catalog_repository_url" {
  value = aws_ecr_repository.book_catalog.repository_url
  description = "The URL of the book_catalog ECR repository"
}

# Output the repository URL for inventory_management
output "inventory_management_repository_url" {
  value = aws_ecr_repository.inventory_management.repository_url
  description = "The URL of the inventory_management ECR repository"
}
output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = aws_subnet.public.*.id
}

output "private_subnets" {
  value = aws_subnet.private.*.id
}

# Output the role ARNs for easy reference
output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_group_role_arn" {
  value = aws_iam_role.eks_node_group_role.arn
}

