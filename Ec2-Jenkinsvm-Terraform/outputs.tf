
output "ec2_public_ip" {
  value       = aws_instance.Webserver.public_ip
  description = "PublicIP"
}
output "key-pair" {
 value = aws_instance.Webserver.key_name
}
output "ami" {
  description = "selected ami"
  value = aws_instance.Webserver.ami
}
output "aws_ec2_instance_state" {
  value = aws_instance.Webserver.instance_state
}