resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http"
  description = "Allow HTTP on port-80, SSH on port 22 and custom TCP on port 8080 inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id
  tags = {
    Name = "allow_http_ssh"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh.id
  #cidr_ipv4         = aws_vpc.main.cidr_block
  cidr_ipv4 = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh.id
  #cidr_ipv4         = aws_vpc.main.cidr_block
  cidr_ipv4 = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_jenkins" {
  security_group_id = aws_security_group.allow_http_ssh.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 8080
  ip_protocol = "tcp"
  to_port = 8080
}

# Egress Rule
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http_ssh.id
  security_group_id = aws_security_group.allow_custom_ports.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_security_group" "allow_cutom_ports" {
  name        = "allow_custom"
  description = "Allow custom TCP on port 5000 inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id
  tags = {
    Name = "allow_custum_tcp"
  }
}
resource "aws_vpc_security_group_ingress_rule" "allow_custom_traffic" {
  security_group_id = aws_security_group.allow_cutom_ports.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 5000
  ip_protocol = "tcp"
  to_port = 5000
}
# Egress Rule
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_custom" {
  security_group_id = aws_security_group.allow_custom_ports.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}