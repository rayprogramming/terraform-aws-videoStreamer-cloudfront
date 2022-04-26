terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.3"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  alias  = "east-1"
}

resource "random_pet" "this" {
  length = 3
}
