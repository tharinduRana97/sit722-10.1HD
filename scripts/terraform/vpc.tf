module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = var.app_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  intra_subnets = var.intra_subnets
  public_subnets  = var.public_subnets


  enable_nat_gateway = true

  # Ensure that public subnets automatically assign public IPs
  map_public_ip_on_launch = true


  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}