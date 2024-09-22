# outputs.tf

# Output the EKS Cluster Name from the module
output "eks_cluster_name" {
  value = module.eks.cluster_id
  description = "The name of the EKS cluster"
}

# Output the role ARNs for easy reference
output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
  description = "The ARN of the IAM role for the EKS cluster"
}

output "eks_node_group_role_arn" {
  value = aws_iam_role.eks_node_group_role.arn
  description = "The ARN of the IAM role for the EKS node group"
}

# Output the repository URLs for ECR
output "gateway_repository_url" {
  value       = aws_ecr_repository.gateway.repository_url
  description = "The URL of the gateway ECR repository"
}

output "history_repository_url" {
  value       = aws_ecr_repository.history.repository_url
  description = "The URL of the history ECR repository"
}

output "metadata_repository_url" {
  value       = aws_ecr_repository.metadata.repository_url
  description = "The URL of the metadata ECR repository"
}

output "mock-storage_repository_url" {
  value       = aws_ecr_repository.mock-storage.repository_url
  description = "The URL of the mock-storage ECR repository"
}

output "video-streaming_repository_url" {
  value       = aws_ecr_repository.video-streaming.repository_url
  description = "The URL of the video-streaming ECR repository"
}

output "video-upload_repository_url" {
  value       = aws_ecr_repository.video-upload.repository_url
  description = "The URL of the video-upload ECR repository"
}

# Output the VPC ID
output "vpc_id" {
  value = module.vpc.vpc_id
  description = "The ID of the VPC"
}

# Output the Public Subnets IDs
output "public_subnets" {
  value = module.vpc.public_subnets
  description = "The IDs of the public subnets"
}

# Output the Private Subnets IDs
output "private_subnets" {
  value = module.vpc.private_subnets
  description = "The IDs of the private subnets"
}

# Output the Intra Subnets IDs
output "intra_subnets" {
  value = module.vpc.intra_subnets
  description = "The IDs of the intra subnets"
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane."
  value       = module.eks.cluster_security_group_id
}