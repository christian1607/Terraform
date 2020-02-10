resource "aws_elb" "load_balancer" {
  name = "tf-load-balancer"
  # availability_zones = ["us-east-1a"]
  subnets         = ["${aws_subnet.sn-us-east-1a-public.id}"]
  security_groups = ["${aws_security_group.sg-elb.id}"]
  depends_on      = ["aws_security_group.sg-elb"]

  listener {
    lb_port           = 80
    lb_protocol       = "HTTP"
    instance_port     = 80
    instance_protocol = "HTTP"

  }
  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 10
    interval            = 60
    target              = "TCP:80"
  }
}


resource "aws_launch_configuration" "launch_config" {
  name          = "launch_config_web_server"
  image_id      = "${var.ami_web_server}"
  instance_type = "${var.instance_type_web_server}"
  key_name      = "${aws_key_pair.ec2-key.key_name}"
  user_data     = "${file("../scripts/install_apache.sh")}"
  security_groups = [
    "${aws_security_group.sg-webserver.id}"
  ]

}

resource "aws_autoscaling_group" "web_server_autoscaling" {

  name                      = "web_server_autoscaling"
  max_size                  = "5"
  min_size                  = "2"
  launch_configuration      = "${aws_launch_configuration.launch_config.name}"
  health_check_grace_period = "300"
  health_check_type         = "ELB"
  load_balancers            = ["${aws_elb.load_balancer.name}"]
  vpc_zone_identifier       = ["${aws_subnet.sn-us-east-1a-public.id}"]


  tag {
    key                 = "Name"
    value               = "Tf-WebServer"
    propagate_at_launch = true
  }

  tag {
    key                 = "Env"
    value               = "${local.enviroment}"
    propagate_at_launch = true
  }
  tag {
    key                 = "Project"
    value               = "${local.project}"
    propagate_at_launch = true

  }
  tag {
    key                 = "Owner"
    value               = "${local.owner}"
    propagate_at_launch = true

  }

}

resource "aws_autoscaling_policy" "cpu_utilization" {
  name                   = "cpu-utilization"
  autoscaling_group_name = "${aws_autoscaling_group.web_server_autoscaling.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"

}


output "elb_dns_name" {
  value = "${aws_elb.load_balancer.dns_name}"
}
