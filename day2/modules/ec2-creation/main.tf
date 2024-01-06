provider "aws" {
    region = "us-east-1"
  
}
variable "ami" {
    description = "Ami Id"
}
variable "instance_type" {
    description = "size of the instance"
  
}
resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type
  
}