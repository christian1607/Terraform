data "template_file" "instalar_apache" {
  
  template = "${file("../scripts/install_apache.sh")}"
  vars = {
    db_address = "${data.terraform_remote_state.mysql_state.outputs.address}"
    db_port = "${data.terraform_remote_state.mysql_state.outputs.port}"

  }
}
#This is a read only state
data "terraform_remote_state" "mysql_state" {

  backend = "s3"
  config = {
    bucket = "tf-autoscaling"
    key    = "state/terraform_db.tfstate"
    region = "us-east-1"
  }
}
