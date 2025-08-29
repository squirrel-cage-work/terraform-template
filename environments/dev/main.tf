provider "aws" {
    region = var.aws_region
}

module "vpc" {
    source               = "../../modules/vpc"
    cidr_block           = var.vpc_cidr_block
    name                 = var.vpc_name
    public_subnet_cidrs  = var.vpc_public_subnet_cidrs
    private_subnet_cidrs = var.vpc_private_subnet_cidrs
    azs                  = var.vpc_azs
}

module "ecr" {
    source          = "../../modules/ecr"
    repository_name = var.ecr_repository_name
}