resource "aws_instance" "my_ec2" {
  #ami = "ami-0ef0a3b4303b17ec5" #Amazon Ohio us-east-2
  ami = "ami-0cb91c7de36eed2cb" # Ubuntu Ohio us-east-2
  #ami           = "ami-04b4f1a9cf54c11d0" # Ubuntu us-east-1
  instance_type = "t2.micro"
  user_data     = file("app1-install.sh")
  tags = {
    "name" = "Apache2-Webserver"
  }
}