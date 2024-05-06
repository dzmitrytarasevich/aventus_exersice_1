resource "aws_launch_template" "wazuh_worker_asg" {
  name = "wazuh-launch-template"
  image_id      = var.wazuh_worker__ami
  instance_type = var.wazuh_worker__instance_type
  key_name = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = var.wazuh_worker_lb_sg

  tags = {
    Name = "wazuh-worker"
  }
}

resource "aws_autoscaling_group" "wazuh_worker_asg" {
  vpc_zone_identifier = var.zone_identifier
  desired_capacity   = 3
  max_size           = 3
  min_size           = 1
  target_group_arns  = [ aws_lb_target_group.wazuh-tg.arn ]

  launch_template {
    id      = aws_launch_template.wazuh_worker_asg.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "Wazuh-Worker"
    propagate_at_launch = true
  }
}

resource "aws_key_pair" "key_pair" {
  key_name   = "wazuh_worker_key"
  public_key = var.ssh_public_key
}
