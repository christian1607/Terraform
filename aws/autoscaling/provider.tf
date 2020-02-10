terraform {
  required_providers {
    aws = "~> 2.0"
  }

  backend "s3" {
    bucket         = "tf-autoscaling"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-scaling-lock"
  }
}

#Default region
provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}


