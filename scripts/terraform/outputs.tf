# outputs.tf

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr.repository_url
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}
