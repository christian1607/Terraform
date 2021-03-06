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

resource "aws_internet_gateway" "ig-tf" {

    vpc_id = "${aws_vpc.vpc-us.id}"
    
    tags = {
        Name = "ig-tf"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }
}

resource "aws_route_table" "rt-tf" {

    vpc_id  = "${aws_vpc.vpc-us.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.ig-tf.id}"
    }

    tags = {
        Name = "public-route-table"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }
}


resource "aws_route_table_association" "rta-public-1" {
    subnet_id = "${aws_subnet.sn-us-east-1a-public.id}"
    route_table_id = "${aws_route_table.rt-tf.id}"
}

resource "aws_route_table_association" "rta-public-2" {
    subnet_id = "${aws_subnet.sn-us-east-1b-public.id}"
    route_table_id = "${aws_route_table.rt-tf.id}"
}


resource "aws_security_group" "allow-ssh" {
    
    name = "allow-ssh"
    vpc_id = "${aws_vpc.vpc-us.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]                                                                       
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["190.236.204.144/32"]
    }

     tags = {
        Name = "sg-allow-ssh"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }
}



resource "aws_security_group" "sg-webserver" {
    
    name = "sg_webserver"
    vpc_id = "${aws_vpc.vpc-us.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]                                                                       
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]    
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
                        "190.236.204.144/32", #Home
                        "200.37.217.53/32" #FP
                    ]
    }

    tags = {
        Name = "sg-webserver"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }
}


resource "aws_security_group" "sg-elb" {
    
    name = "sg_elb"
    vpc_id = "${aws_vpc.vpc-us.id}"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]                                                                       
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]    
    }

    
    tags = {
        Name = "sg-elb"
        Env  = "${local.enviroment}"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }
}
