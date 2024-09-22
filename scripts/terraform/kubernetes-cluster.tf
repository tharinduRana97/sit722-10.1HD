module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.1"

  cluster_name                   = var.app_name

  enable_irsa = true

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.large"]
    attach_cluster_primary_security_group = true
  }
  cluster_iam_role_name          = aws_iam_role.eks_cluster_role.name
  node_group_iam_role_name       = aws_iam_role.eks_node_group_role.name

  eks_managed_node_groups = {
    amc-cluster-wg = {
      min_size     = 1
      max_size     = 1
      desired_size = 1
      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
      tags = {
        ExtraTag = "helloworld"
      }
    }
  }

  tags = var.tags 
}
