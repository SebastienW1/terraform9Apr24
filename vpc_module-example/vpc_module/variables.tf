variable "ami_image_name" {

  default = "ami-080e1f13689e07408"

  type = string

  description = "This is a variable for AMI image"

}

variable "instance_type" {

  type    = string
  default = "t2.micro"

  description = "This is a variable for Instance type"

}

variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "This is the CIDR VPC IP range"

}

variable "cidr_block_public_subnet_ip_range" {
  type        = string
  default     = "10.0.1.0/24"
  description = "This is the CIDR public Subnet IP range"

}

variable "cidr_block_private_subnet_ip_range" {
  type        = string
  default     = "10.0.2.0/24"
  description = "This is the CIDR Private Subnet IP range"

}

/*
variable "ec2_count_name" {
  type        = list(any)
  description = "count example"

}


variable "ec2_list_name" {
  type        = set(string)
  description = "list examples"

}

*/

variable "subnets" {

  type        = any
  description = "to use for each and re-use subnets codes based on variables"

}

variable "vm" {

  type        = any
  description = "for vm objects variables"

}