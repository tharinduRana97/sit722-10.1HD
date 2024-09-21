module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                   = var.app_name
  cluster_endpoint_public_access = true

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

  vpc_id                   = aws_vpc.vpc.id
  subnet_ids               = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  control_plane_subnet_ids = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  # EKS Managed Node Group(s)
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

  tags = local.tags
}
