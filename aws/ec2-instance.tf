resource "aws_vpc" "vpc-us" {

  cidr_block = "172.16.0.0/16"

  tags = {
    name = "vpc-terraform"
  }
}

resource "aws_subnet" "sn-us-west-2a" {
  vpc_id            = "${aws_vpc.vpc-us.id}"
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    name = "subnet-terraform"
  }
}

resource "aws_network_interface" "net-interface" {
  subnet_id   = "${aws_subnet.sn-us-west-2a.id}"
  private_ips = ["172.16.10.100"]

  tags = {
    name = "primary_network_interface"
  }
}

resource "aws_instance" "web-server" {

  count = 2

  ami           = "ami-22b9a343" # us-west-2
  instance_type = "t2.micro"

  tags = {
    name = "${var.server_name}-${count.index+1}"
  }

  network_interface {
    network_interface_id = "${aws_network_interface.net-interface.id}"
    device_index         = 0
  }

  
}