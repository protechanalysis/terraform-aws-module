resource "aws_lb" "app_lb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = var.alb_sg_id

  access_logs {
    bucket  = var.s3_log_bucket_id
    prefix  = "dev-lb"
    enabled = var.enable_log
  }

  tags = var.tags
}

resource "aws_lb_target_group" "webapp_tg" {
  name     = "${var.name}-tg"
  port     = var.port
  protocol = var.protocol
  vpc_id   = var.vpc_id
  target_type = "instance"
  health_check {
    path                = var.health_check_path
    protocol            = var.protocol
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }
  tags = var.tags
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp_tg.arn
  }

  tags = var.tags
}

resource "aws_lb_target_group_attachment" "attachment" {
  for_each = {
    for idx, id in var.instance_ids : "instance_${idx}" => id
  }
  target_group_arn = aws_lb_target_group.webapp_tg.arn
  target_id        = each.value
  port             = var.port
}
