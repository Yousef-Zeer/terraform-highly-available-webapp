# -----------------------------
# Launch Template
# -----------------------------
resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-lt-"
  image_id      = "ami-00ca32bbc84273381"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key.key_name

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  vpc_security_group_ids = [aws_security_group.HTTP-SG.id]

  user_data = base64encode(<<-EOF
 #!/bin/bash
 yum update -y
 yum install -y python3
 echo "Hello, World from YousefZeer" > /home/ec2-user/index.html
 chmod 644 /home/ec2-user/index.html
 cd /home/ec2-user
 nohup python3 -m http.server 80 &
 EOF
)
}

# -----------------------------
# Auto Scaling Group using Launch Template
# -----------------------------
resource "aws_autoscaling_group" "app_asg" {
  name_prefix         = "asg-app-"
  min_size            = 1
  max_size            = 3
  desired_capacity    = 2
  vpc_zone_identifier = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.test.arn]

  tag {
    key                 = "Name"
    value               = "ASG_Instance"
    propagate_at_launch = true
  }
}
