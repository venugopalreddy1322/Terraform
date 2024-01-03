resource "aws_security_group" "ec2-sg-ssh" {
  description = "Allow HTTP inbound traffic only from ALB"
  # The following Inbound rule we use when we are using ALB
  /*ingress {
    description      = "HTTP from ALB"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    #cidr_blocks      = [] #instead of cidr Security-Group of ALB
    security_groups = ["${aws_security_group.alb-sg.id}"]
  }*/
  ingress {
    description = "Allow traffic from anywhere to do SSH on port 22"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow traffic from anywhere to do HTTP on port 80"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow traffic from anywhere on port 8080"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ec2-sg"
  }
}


resource "aws_instance" "webserver" {
    ami = var.ami_id
    instance_type = var.instance_type_value
    vpc_security_group_ids = [aws_security_group.ec2-sg-ssh.id]
    # here attaching the keypair to the instance
    # this keypair is created through console
    # To attach- the .pem file should be in the same directory
    # in this example in Day1 folder
    key_name = "ec2keypair"
    tags = {
      Name = "${var.name}-instance" 
      # terraform plan/apply -var-file="prod.tfvars" -this will fetch the variable value form given file
      # in this example prod.tfvars
    }  
}