terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40.0"
    }
  }

  backend "s3" {
    bucket = "terraformbucketseb"
    key    = "terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "statelock_seb"
  }
  
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
