# Create an EKS cluster
resource "aws_eks_cluster" "eks" {
  name     = var.app_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.kubernetes_version

  vpc_config {
    subnet_ids = [
      aws_subnet.public_subnet_1.id,
      aws_subnet.public_subnet_2.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSVPCResourceController
  ]
}

# Create a managed node group with a single node
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "${var.app_name}-node-group"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = aws_eks_cluster.eks.vpc_config[0].subnet_ids

  scaling_config {
    desired_size = 1  # Number of nodes to provision
    min_size     = 1  # Minimum number of nodes
    max_size     = 1  # Maximum number of nodes
  }

  instance_types = ["t3.medium"]  # Change to your preferred instance type

  depends_on = [
    aws_eks_cluster.eks,
    aws_iam_role_policy_attachment.eks_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_node_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.eks_node_AmazonEKSVPCResourceController
  ]
}
