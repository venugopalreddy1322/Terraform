# Input variables
# AWS Region
variable "aws_region" {
  description = "AWS Region in which resources to be created"
  type        = string
  default     = "us-east-1"
}
# AWS EC2 Instance Type
variable "instance_type" {
  description = "Ec2 Instance type"
  default     = "t2.micro"
  type        = string
}
# Instance name
variable "instance_name" {
  description = "Name of the Instance"
  default = "Jenkins-Sever-amzLinux2"
}
variable "keypair" {
    description = "Ec2keypair"
    default = "ec2-us-east-1"
}

