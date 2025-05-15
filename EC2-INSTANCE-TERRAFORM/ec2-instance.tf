resource "aws_instance" "Webserver" {
  ami           = data.aws_ami.amz2ami.id
  instance_type = var.instance_type
  key_name = var.keypair
  user_data     = file("userdata.sh")
  tags = {
    "name" = "Amazon-Linux-Webserver"
  }
}