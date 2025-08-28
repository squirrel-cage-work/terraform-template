variable "cidr_block" {
    description = "CIDR block for the VPC"
    type        = string
}

variable "name" {
    description = "Name of the VPC"
    type        = string
}

variable "public_subnet_cidrs" {
    description = "CIDRs for public subnets"
    type        = list(string)
}

variable "private_subnet_cidrs" {
    description = "CIDRs for private subnets"
    type        = list(string)
}

variable "azs" {
    description = "Availability zones"
    type        = list(string)
}