data "terraform_remote_state" "mysql_state" {

  backend = "s3"
  config {
    bucket = "tf-autoscaling"
    key    = "state/terraform_db.tfstate"
    region = "us-east-1"
  }
}
