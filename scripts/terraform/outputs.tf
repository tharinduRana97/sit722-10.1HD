# outputs.tf

output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "ecr_repository_url" {
  value = local.ecr_repository_exists ? data.aws_ecr_repository.existing.repository_url : (aws_ecr_repository.ecr[0].repository_url)
}


output "vpc_id" {
  value = aws_vpc.vpc.id
}
