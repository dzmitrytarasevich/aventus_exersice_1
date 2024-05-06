resource "aws_launch_template" "es_master_asg" {
  name = "es-master-launch-template"
  image_id      = var.es_master_ami
  instance_type = var.es_master_instance_type
  tags = {
    Name = "es-terraform"
  }
}

resource "aws_autoscaling_group" "asg_terraform" {
  vpc_zone_identifier = var.zone_identifier
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1

  launch_template {
    id      = aws_launch_template.es_master_asg.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "ES-Master-TF"
    propagate_at_launch = true
  }
}