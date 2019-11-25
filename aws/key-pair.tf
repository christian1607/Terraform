resource "aws_key_pair" "ec2-key" {

    public_key = "${file("keys/keypair.pub")}"
    key_name = "ec2-private-key"
  
}
