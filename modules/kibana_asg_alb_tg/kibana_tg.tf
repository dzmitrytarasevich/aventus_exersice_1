
resource "aws_lb_target_group" "kibana-tg" {
  name        = "kibana-alb-tg"
  port        = 5601
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.kibana_vpc_id
}

resource "aws_lb_listener" "kibana-lb-listener" {
  load_balancer_arn = aws_lb.kibana_alb.arn
  port              = "5601"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "CERTIFICATE ARN WAS HERE"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kibana-tg.arn
  }
  tags = {
    Application = "Kibana"
  }
}