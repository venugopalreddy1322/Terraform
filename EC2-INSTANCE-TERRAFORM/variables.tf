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
variable "keypair" {
    description = "Ec2keypair"
    default = "ec2-us-east-1"
}

