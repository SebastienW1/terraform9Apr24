resource "aws_internet_gateway" "gw-seb" {
  vpc_id = aws_vpc.myVpc-seb.id
  tags = {
    Name = "gw-seb"
  }
}