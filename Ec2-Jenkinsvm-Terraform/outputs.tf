
output "ec2_public_ip" {
  value       = aws_instance.Webserver.public_ip
  description = "PublicIP"
}
output "key-pair" {
 value = aws_instance.Webserver.key_name
}