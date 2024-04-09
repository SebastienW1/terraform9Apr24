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


module "vpc_module"{

    source= "../vpc_module"
   # vpc_name= "myvpc_seb"
    cidr_block ="10.0.0.0/16"

  #  private_subnet_ip_range="10.0.1.0/24"
   # public_subnet_ip_range="10.0.2.0/24"

    instance_type = "t2.micro"
   # ami_image = "ami-080e1f13689e07408"


subnets = {

  public_subnet-seb = {

    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1e"
    subnet_tag              = "public-subnet-seb"
  }

  private_subnet-seb = {

    cidr_block              = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1b"
    subnet_tag              = "private-subnet-seb"
  }

}

vm = {
  public_vm = {

    ami                         = "ami-080e1f13689e07408"
    instance_type               = "t2.micro"
    key_name                    = "myKey-seb"
    availability_zone           = "us-east-1e"
    subnet_id                   = "public_subnet-seb"
    associate_public_ip_address = true
    security_group              = "public_sg"
    tag_name                    = "public VM - Seb"

  }


  private_vm = {

    ami                         = "ami-080e1f13689e07408"
    instance_type               = "t2.micro"
    key_name                    = "myKey-seb"
    availability_zone           = "us-east-1e"
    subnet_id                   = "private_subnet-seb"
    associate_public_ip_address = true
    security_group              = "private_sg"
    tag_name                    = "private VM - Seb"

  }

}

}