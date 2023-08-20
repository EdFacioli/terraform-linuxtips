
terraform {
  backend "s3" {
    bucket = "facioli.dev.br-linuxtip-terraform"
    key    = "terraform-test.tfstate"
    region = "us-east-2"

  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}
