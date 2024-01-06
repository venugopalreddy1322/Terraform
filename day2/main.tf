provider "aws" {
    region = "us-east-1"
}
variable "ami" {
    description = "AMI value"  
}
variable "instance_type" {
    description = "Size of instance"  
}

module "ec2-creation" {
    source = "./modules/ec2-creation"
    ami = var.ami
    instance_type = var.instance_type
}