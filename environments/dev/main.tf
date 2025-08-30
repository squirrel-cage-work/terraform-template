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

module "alb" {
  source = "../../modules/alb"
  vpc_id            = module.vpc.vpc_id
  service_name      = var.alb_service_name
  ingress_from_port = var.alb_ingress_from_port
  ingress_to_port   = var.alb_ingress_to_port
  ingress_protocol  = var.alb_ingress_protocol
  name              = var.alb_name
  public_subnet_ids = module.vpc.public_subnet_ids
  target_port       = var.alb_target_port
  target_protocol   = var.alb_target_protocol
  health_check_path = var.alb_health_check_path
  listener_port     = var.alb_listener_port
  listener_protocol = var.alb_listener_protocol
}

module "ecr" {
  source          = "../../modules/ecr"
  repository_name = var.ecr_repository_name
}

module "iam" {
  source = "../../modules/iam"
}

module "ecs" {
  source            = "../../modules/ecs"
  vpc_id            = module.vpc.vpc_id 
  service_name      = var.ecs_service_name
  ingress_from_port = var.ecs_ingress_from_port
  ingress_to_port   = var.ecs_ingress_to_port
  ingress_protocol  = var.ecs_ingress_protocol
  # ecs cluster
  cluster_name      = var.ecs_cluster_name
}