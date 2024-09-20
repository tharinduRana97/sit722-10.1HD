# variables.tf

variable "app_name" {
  default = "s224169428"
}

variable "container_registry" {
  default = "s224169428Kube"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "kubernetes_version" { 
  default = "1.24"   
}

variable "aws_availability_zone" {
  default = "us-east-1a"
}
