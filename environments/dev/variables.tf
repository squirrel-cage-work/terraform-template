variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_public_subnet_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "vpc_private_subnet_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
}

variable "vpc_azs" {
  description = "Availability zones"
  type        = list(string)
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "ecs_service_name" {
    description = "The ECS service name"
    type        = string
}

variable "ecs_ingress_from_port" {
    description = "ingress from port for the ecs service security group"
    type        = number
}

variable "ecs_ingress_to_port" {
    description = "ingress to port for the ecs service security group"
    type        = number
}

variable "ecs_ingress_protocol" {
    description  = "ingress protocol for the ecs service security group"
    type         = string
}


# ecs cluster name
variable "ecs_cluster_name" {
    description = "ecs cluster name"
    type        = string
}