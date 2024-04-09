resource "aws_security_group" "allow_different_traffic-seb" {
  name        = "Public Security Group  - Allow TLS"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myVpc-seb.id

  #allow incoming traffic from anywhere 0.0.0.0/0

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]


  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }


  tags = {
    Name = "allow_tls-seb"
  }
}


resource "aws_security_group" "private_security_group" {
  name        = "Private Security Group 1"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myVpc-seb.id

  #allow incoming traffic from anywhere 0.0.0.0/0

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]


  }


  tags = {
    Name = "Private Security Group -seb"
  }
}