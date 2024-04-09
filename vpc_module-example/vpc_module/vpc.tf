resource "aws_vpc" "myVpc-seb" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = {
    Name = "myVpc-seb"
  }
}


