# server security group
resource "aws_security_group" "syslog-sg" {
  name        = "syslog-sg"
  description = "syslog-sg"
  vpc_id      = aws_vpc.syslog.id

  tags = {
    Name = "syslog-sg"
  }
}

# inbound ssh access
resource "aws_security_group_rule" "ssh-in" {
  type        = "ingress"
  description = "ssh access"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.ssh_cidr_blocks

  security_group_id = aws_security_group.syslog-sg.id
}

# syslog inbound
resource "aws_security_group_rule" "syslog-in" {
  type        = "ingress"
  description = "syslog access"
  from_port   = 514
  to_port     = 514
  protocol    = "udp"
  cidr_blocks = [var.ssh_cidr_blocks]

  security_group_id = aws_security_group.syslog-sg.id
}

# https outbound
resource "aws_security_group_rule" "https-out" {
  type        = "egress"
  description = "https access"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.syslog-sg.id
}

# http outbound
resource "aws_security_group_rule" "http-out" {
  type        = "egress"
  description = "http access"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.syslog-sg.id
}