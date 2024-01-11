output "ipaddress" {
  value = aws_instance.webserver.public_ip

}
output "key-pair" {
  value = aws_instance.webserver.key_name

}