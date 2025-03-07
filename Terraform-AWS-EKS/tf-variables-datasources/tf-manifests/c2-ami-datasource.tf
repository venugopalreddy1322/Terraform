data "aws_ami" "amz2ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20250220.0-x86_64-gp2"] #Free-tier eligible
  }
  filter {
    name   = "is-public"
    values = ["true"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

/*data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*", "ubuntu/images/hvm-ssd-gp3/ubuntu-*-amd64-server-*"]
    #values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
  
  filter {
    name   = "is-public"
    values = ["true"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
*/
