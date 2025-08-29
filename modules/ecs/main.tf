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