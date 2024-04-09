resource "aws_subnet" "subnets" {
  vpc_id                  = aws_vpc.myVpc-seb.id
  cidr_block              = each.value.cidr_block
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  availability_zone       = each.value.availability_zone
  tags = {
    Name = each.value.subnet_tag
  }

  for_each = var.subnets
}

/*
resource "aws_subnet" "public_subnet-seb" {
  vpc_id = aws_vpc.myVpc-seb.id
  cidr_block = var.cidr_block_public_subnet_ip_range
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"
  tags = {
    Name = "public_subnet-seb"
  }
}

resource "aws_subnet" "private_subnet-seb" {
  vpc_id                  = aws_vpc.myVpc-seb.id
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1e"
  cidr_block              = var.cidr_block_private_subnet_ip_range

  tags = {
    Name = "private_subnet-seb"
  }
}

*/