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