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