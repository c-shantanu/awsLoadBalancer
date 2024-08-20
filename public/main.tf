provider "aws" {
  region = var.region
}

provider "vault" {
  address = var.vault_address
  token   = var.vault_token
}

resource "aws_lb" "this" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection

  tags = var.tags
}

resource "aws_lb_target_group" "this" {
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id
  target_type = var.target_type

  health_check {
    interval            = var.health_check_interval
    path                = var.health_check_path
    protocol            = var.health_check_protocol
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }

  tags = var.tags
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "vault_generic_secret" "alb_credentials" {
  path = "secret/data/aws/alb"

  data_json = jsonencode({
    "alb_arn"      = aws_lb.this.arn,
    "alb_dns_name" = aws_lb.this.dns_name,
    "alb_zone_id"  = aws_lb.this.zone_id
  })
}
