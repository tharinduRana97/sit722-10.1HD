module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                   = var.app_name
  cluster_endpoint_public_access = true

  # Disable KMS encryption by not configuring KMS-related parameters
  create_kms_key = false

  cluster_encryption_config = (var.kms_key_arn != null ? {
      provider_key_arn = var.kms_key_arn
      resources        = ["secrets"]
    } : null)

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.public_subnets
  control_plane_subnet_ids = module.vpc.public_subnets

  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.large"]
    attach_cluster_primary_security_group = true
  }

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
