terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }

  required_version = ">= 0.15.5"
}

provider "aws" {
  profile = "COMPANY-sandbox"
  region  = "eu-central-1"
}