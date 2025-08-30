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

# ALB
resource "aws_lb" "this" {
    name               = var.name
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.ecs_service_sg.id]
    subnets            = var.public_subnet_ids

    tags = {
        Name = var.name
    }
}

# ALB Target Group
resource "aws_lb_target_group" "this" {
    name        = "${var.name}-target-group"
    port        = var.target_port
    protocol    = var.target_protocol
    target_type = "ip" 

    vpc_id      = var.vpc_id

    health_check {
        path     = var.health_check_path 
    }

    tags = {
        Name = "${var.name}-target-group"
    }
}

# ALB Listener
resource "aws_lb_listener" "this" {
    load_balancer_arn = aws_lb.this.arn
    port              = var.listener_port
    protocol          = var.listener_protocol

    default_action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.this.arn
    }
}