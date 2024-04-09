resource "aws_instance" "AppServer_Count-Sebastien" {

  ami = var.ami_image_name

  instance_type = var.instance_type

  tags = {
    "Name" = var.ec2_count_name[count.index]
    "env"  = "Dev"
  }
  count = length(var.ec2_count_name)
}

