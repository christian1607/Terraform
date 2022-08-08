resource "aws_vpc" "vpc-us" {

    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_classiclink = "false"
    enable_dns_hostnames = "true"

    tags = {
        Name = "vpc-tf"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
    }
}
#Public subnet
resource "aws_subnet" "sn-us-east-1a-public" {
  
    vpc_id            = "${aws_vpc.vpc-us.id}"
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = "true"


    tags = {
        Name = "sn-us-east-1a-public"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }
}

resource "aws_subnet" "sn-us-east-1b-public" {
  
    vpc_id            = "${aws_vpc.vpc-us.id}"
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = "true"
  
    tags = {
        Name = "sn-us-east-1b-public"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }
}



resource "aws_subnet" "sn-us-east-1a-private" {
  
    vpc_id            = "${aws_vpc.vpc-us.id}"
    cidr_block        = "10.0.3.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = "true"

    tags = {
    Name = "sn-us-east-1a-private"
    Env  = "${local.enviroment}"
    Project = "${local.project}"
    Owner = "${local.owner}"
    }
}

resource "aws_subnet" "sn-us-east-1b-private" {
  
    vpc_id            = "${aws_vpc.vpc-us.id}"
    cidr_block        = "10.0.4.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = "true"
  
    tags = {
        Name = "sn-us-east-1b-private"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }
} 
