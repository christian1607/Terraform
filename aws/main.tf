
terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "2.22.0"
    }
  }

  cloud {
    organization = "caltamirano"

    workspaces {
      name = "aws"
    }
  }
}


provider "aws" {}


