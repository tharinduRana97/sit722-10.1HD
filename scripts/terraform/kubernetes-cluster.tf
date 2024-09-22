module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.1"

  cluster_name                   = var.app_name
  cluster_endpoint_public_access = true

  # Use the correct argument for the cluster IAM role
  iam_role_name = aws_iam_role.eks_cluster_role.name

  # Node Group configuration
  eks_managed_node_groups = {
    amc-cluster-wg = {
      min_size     = 1
      max_size     = 1
      desired_size = 1
      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
      # Use the correct argument for the node group IAM role
      iam_role = aws_iam_role.eks_node_group_role.name
      tags = {
        ExtraTag = "helloworld"
      }
    }
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = var.tags 
}
