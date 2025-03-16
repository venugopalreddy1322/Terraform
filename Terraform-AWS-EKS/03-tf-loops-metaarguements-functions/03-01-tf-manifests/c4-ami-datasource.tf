# Get latest AMI ID for Amazon Linux2 OS

data "aws_ami" "amz2ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    #values = ["amzn2-ami-*-*-hvm-*-gp2"]
    values = ["amzn2-ami-kernel-*-hvm-*-x86_64-gp2"] #Free-tier eligible
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