
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "mizi-iac-development"
    key     = "terraform.tfstate"
    region  = "ap-southeast-1"
    profile = "mizi"
    encrypt = true
  }
}
