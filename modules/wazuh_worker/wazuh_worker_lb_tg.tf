resource "aws_lb" "wazuh_worker_alb" {
  name               = "wazuh-worker-alb-tf"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.wazuh_worker_lb_subnets

  enable_deletion_protection = false

  tags = {
    Environment = "Staging"
  }
}

resource "aws_lb_target_group" "wazuh-tg" {
  name        = "wazuh-alb-tg"
  port        = 1514
  protocol    = "TCP"
  target_type = "instance"
  vpc_id      = var.wazuh_worker_vpc_id
}

resource "aws_lb_listener" "wazuh-lb-listener" {
  load_balancer_arn = aws_lb.wazuh_worker_alb.arn
  port              = "1514"
  protocol          = "TCP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wazuh-tg.arn
  }
}