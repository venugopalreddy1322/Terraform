resource "aws_instance" "Webserver" {
  ami           = data.aws_ami.amz2ami.id
  instance_type = var.instance_type
  key_name = var.keypair
  user_data     = file("userdata-jenkins.sh")
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]
  root_block_device {
  volume_size = 16  # Default Free Tier size
  volume_type = "gp2"  # Free Tier eligible (NOTE gp2/gp3 will depends on ami you selected)
  }
  tags = {
    "name" = "Jenkins-Server-Amz-Linux"
  }
}
resource "aws_ec2_instance_state" "stop_or_instance" {
  instance_id = aws_instance.Webserver.id
  #state       = "stopped"  # Change to "running" to start the instance
  state = "start"
}
