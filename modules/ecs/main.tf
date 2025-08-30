resource "aws_security_group" "ecs_service_sg" {
    name        = "${var.service_name}-sg"
    description = "Security Group for ECS Service"
    vpc_id      = var.vpc_id

    ingress {
        from_port = var.ingress_from_port
        to_port   = var.ingress_to_port
        protocol  = var.ingress_protocol
        cidr_blocks = ["162.120.185.18/32"]
    }

}




# ecs cluster
resource "aws_ecs_cluster" "this" {
    name = var.cluster_name
}

# ecs task definition
/*
resource "aws_ecs_task_definition" "task_temp" {
    family                   = var.family
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    cpu                      = var.cpu
    memory                   = var.memory
    execution_role_arn       = var.execution_role_arn
    task_role_arn            = var.task_role_arn
    container_definitions    = var.container_definitions
}

resource "aws_ecs_service" "service_temp" {
}
*/