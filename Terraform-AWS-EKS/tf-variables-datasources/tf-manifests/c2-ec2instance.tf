resource "aws_instance" "Webserver" {
  ami           = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  tags = {
    "name" = "Ubuntu-Webserver"
  }
}