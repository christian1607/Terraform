
resource "aws_instance" "web-server-1" {

  ami           = "${var.ami_web_server}"
  instance_type = "${var.instance_type_web_server}"
  subnet_id     = "${aws_subnet.sn-us-east-1a-public.id}"
  vpc_security_group_ids = [
    "${aws_security_group.sg-webserver.id}",
  ]

  key_name = "${aws_key_pair.ec2-key.key_name}"
  tags = {
    Name    = "web-server-1"
    Env     = "${local.enviroment}"
    Owner   = "${local.owner}"
    Project = "${local.project}"
  }

}

resource "aws_volume_attachment" "web-server-to-volume-1" {
  volume_id   = "${aws_ebs_volume.volume-1.id}"
  instance_id = "${aws_instance.web-server-1.id}"
  device_name = "/dev/xvdh"
}



resource "aws_instance" "web-server-2" {

  ami           = "${var.ami_web_server}"
  instance_type = "${var.instance_type_web_server}"
  subnet_id     = "${aws_subnet.sn-us-east-1b-public.id}"
  vpc_security_group_ids = [
    "${aws_security_group.sg-webserver.id}"
  ]

  key_name = "${aws_key_pair.ec2-key.key_name}"

  tags = {
    Name    = "web-server-2"
    Env     = "${local.enviroment}"
    Owner   = "${local.owner}"
    Project = "${local.project}"
  }
}



resource "aws_instance" "backend-server-1" {

  ami           = "${var.ami_web_server}"
  instance_type = "${var.instance_type_web_server}"
  subnet_id = "${aws_subnet.sn-us-east-1a-private.id}"
  key_name  = "${aws_key_pair.ec2-key.key_name}"
  vpc_security_group_ids = [
    "${aws_security_group.allow-ssh.id}",
  ]

  tags = {
    Name    = "backend-server-1"
    Env     = "${local.enviroment}"
    Owner   = "${local.owner}"
    Project = "${local.project}"
  }
}

resource "aws_instance" "backend-server-2" {

  ami           = "${var.ami_web_server}"
  instance_type = "${var.instance_type_web_server}"
  subnet_id = "${aws_subnet.sn-us-east-1b-private.id}"
  vpc_security_group_ids = [
    "${aws_security_group.allow-ssh.id}"
  ]

  key_name = "${aws_key_pair.ec2-key.key_name}"
  tags = {
    Name    = "backend-server-2"
    Env     = "${local.enviroment}"
    Owner   = "${local.owner}"
    Project = "${local.project}"
  }
}
