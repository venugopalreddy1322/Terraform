output "ami_id" {
  value = data.aws_ami.ubuntu_ami.id
}
output "ec2_public_ip" {
    value = aws_instance.Webserver.public_ip
}