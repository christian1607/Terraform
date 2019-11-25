resource "aws_ebs_volume" "volume-1" {

    availability_zone = "us-east-1a"
    size = 5
    type = "gp2"
    
     tags = {
        Name = "volume-1"
        Env  = "Dev"
        Project = "${local.project}"
        Owner = "${local.owner}"
    }

    
}
