variable "ami_id" {
  description = "This is AMI Id"
  default = "ami-05b10e08d247fb927" //ubuntu us-east-1
}

variable "instance_type_value" {
  description = "This is Instance Type"
  default = "t2.micro"
}

variable "name" {
  description = "This is webserver name"
  default = "frontend"
}

