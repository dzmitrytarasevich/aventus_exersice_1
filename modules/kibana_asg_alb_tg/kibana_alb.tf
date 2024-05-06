resource "aws_lb" "kibana_alb" {
  name               = "kibana-alb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.kibana_alb_sg
  subnets            = var.kibana_alb_subnets

  enable_deletion_protection = false

  # access_logs {
  #   bucket  = aws_s3_bucket.lb_logs.bucket
  #   prefix  = "kibana-alb"
  #   enabled = true
  # }

  tags = {
    Environment = "Staging"
  }
}