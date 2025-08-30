# ecs security group
variable "vpc_id" {
    description = "the vpc id for ecs service security group"
    type        = string
}

variable "service_name" {
    description = "The ECS service name"
    type        = string
}

variable "ingress_from_port" {
    description = "ingress from port for the ecs service security group"
    type        = number
}

variable "ingress_to_port" {
    description = "ingress to port for the ecs service security group"
    type        = number
}

variable "ingress_protocol" {
    description  = "ingress protocol for the ecs service security group"
    type         = string
}

# ALB
variable "name" {
    description = "name of alb"
    type        = string
}

variable "public_subnet_ids" {
    description = "list of public subnet IDs"
    type        = list(string)
}

variable "target_port" {
    description = "target port"
    type        = number
}

variable "target_protocol" {
    description = "target protocol"
    type        = string
}

variable "health_check_path" {
    description = "health check for target group"
    type        = string
}

variable "listener_port" {
    description = "listener port"
    type        = number
}

variable "listener_protocol" {
    description = "listener protocol"
    type        = string
}