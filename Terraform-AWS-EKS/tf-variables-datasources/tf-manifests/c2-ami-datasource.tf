data "aws_ami" "ubuntu_ami" {

  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-*-amd64-server-*"]
  }
  /*
  # For only ssd and not gp3 images of ubuntu
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
  */
  filter {
    name   = "is-public"
    values = ["true"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
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
output "ami_id" {
  description = "Latest Ubuntu ami-id in us-east-1 Region"
  value       = data.aws_ami.ubuntu_ami.id

}