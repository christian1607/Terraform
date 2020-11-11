/* data "terraform_remote_state" "elb_tf" {

  backend = "s3"
  config = {
    bucket = "tf-autoscaling"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

*/
