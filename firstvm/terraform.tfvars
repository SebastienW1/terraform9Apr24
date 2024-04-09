ami_image_name = "ami-080e1f13689e07408"

instance_type = "t2.micro"

#ec2_list_name = ["AppServer1 list-Seb", "AppServer2 list-Seb", "AppServer3 list-Seb"]
#ec2_count_name = ["WebServer count1-Seb", "WebServer count2-Seb", "WebServer count3-Seb"]

ec2_list_name  = ["AppServer1 list-Seb"]
ec2_count_name = ["WebServer count1-Seb"]


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






