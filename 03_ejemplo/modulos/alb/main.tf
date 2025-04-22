resource "aws_lb" "this" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_alb_id]
  subnets            = var.subnets

  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_target_group" "this" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_lb_target_group_attachment" "amazon_linux_1" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.instance_id_amazon_linux_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "ubuntu_1" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.instance_id_ubuntu_1
  port             = 80
}