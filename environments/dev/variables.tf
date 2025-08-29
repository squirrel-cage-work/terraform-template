variable "aws_region" {
    description = "AWS region to deploy resources"
    type        = string
}

variable "vpc_cidr_block" {
    description = "CIDR block for the VPC" 
    type        = string
}

variable vpc_name {
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