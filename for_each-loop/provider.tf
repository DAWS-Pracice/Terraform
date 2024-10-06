terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.70.0"
    }
  }

  backend "s3" {
    bucket = "pdaws81-remote-state"
    key    = "pdaws81-remote-expense-2"
    region = "us-east-1"
    dynamodb_table = "81s-locking"
    
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}