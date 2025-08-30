variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

# VPC

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

# ALB
variable "alb_service_name" {
    description = "The ECS service name"
    type        = string
}

variable "alb_ingress_from_port" {
    description = "ingress from port for the ecs service security group"
    type        = number
}

variable "alb_ingress_to_port" {
    description = "ingress to port for the ecs service security group"
    type        = number
}

variable "alb_ingress_protocol" {
    description  = "ingress protocol for the ecs service security group"
    type         = string
}

variable "alb_name" {
    description = "name of alb"
    type        = string
}

variable "alb_target_port" {
    description = "target port"
    type        = number
}

variable "alb_target_protocol" {
    description = "target protocol"
    type        = string
}

variable "alb_health_check_path" {
    description = "health check for target group"
    type        = string
}

variable "alb_listener_port" {
    description = "listener port"
    type        = number
}

variable "alb_listener_protocol" {
    description = "listener protocol"
    type        = string
}

# ECR
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