resource "aws_route_table" "public_route-seb" {
  vpc_id = aws_vpc.myVpc-seb.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-seb.id
  }


  tags = {
    Name = "public_route-seb"
  }
}


resource "aws_route_table_association" "public_association-seb" {
  subnet_id      = aws_subnet.subnets["public_subnet-seb"].id
  route_table_id = aws_route_table.public_route-seb.id
}


resource "aws_route_table" "private_route-seb" {
  vpc_id = aws_vpc.myVpc-seb.id


  tags = {
    Name = "private_route-seb"
  }
}


resource "aws_route_table_association" "private_association-seb" {
  subnet_id      = aws_subnet.subnets["private_subnet-seb"].id
  route_table_id = aws_route_table.private_route-seb.id
}

