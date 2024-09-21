variable "app_name" {
  default = "s224169428"
}

variable "container_registry" {
  default = "s224169428kube"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "kubernetes_version" { 
  default = "1.24"   
}

variable "azs" {
  description = "List of public subnet CIDR blocks"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "aws_availability_zone_1" {
  default = "us-east-1a"  # Replace with your preferred AZ
}

variable "aws_availability_zone_2" {
  default = "us-east-1b"  # Replace with your preferred AZ
}

variable "public_subnets" {
  description = "List of public subnet CIDR blocks"
  default     = ["10.123.1.0/24", "10.123.2.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDR blocks"
  default     = ["10.123.3.0/24", "10.123.4.0/24"]
}
variable "vpc_cidr" {
  description = "CIDR blocks"
  default     = "10.123.0.0/16"]
}