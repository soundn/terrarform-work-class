terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "keneji"
    key    = "my-back"
    region = "eu-north-1"
  }

}

provider "aws" {
  region = var.region
}
