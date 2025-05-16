resource "aws_instance" "Webserver" {
  ami           = data.aws_ami.amz2ami.id
  instance_type = var.instance_type
  key_name = var.keypair
  user_data     = file("userdata-jenkins.sh")
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  tags = {
    "name" = "Amazon-Linux-Webserver"
  }
}