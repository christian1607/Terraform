terraform{
  required_providers{
    aws = "~> 2.0"
  }
}

#Default region
provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

