resource "aws_launch_template" "kibana_asg" {
  name = "kibana-launch-template"
  image_id      = var.es_master_ami
  instance_type = var.es_master_instance_type
  vpc_security_group_ids = var.kibana_alb_sg

  tags = {
    Name = "kibana-terraform"
  }
}

resource "aws_autoscaling_group" "asg_terraform" {
  vpc_zone_identifier = var.zone_identifier
  desired_capacity   = 1
  max_size           = 2
  min_size           = 1
  target_group_arns  = [ aws_lb_target_group.kibana-tg.arn ]

  launch_template {
    id      = aws_launch_template.kibana_asg.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "Kibana-TF"
    propagate_at_launch = true
  }
}