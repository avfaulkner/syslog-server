resource "aws_instance" "syslog" {
  ami           = data.aws_ami.syslog.id
  ebs_optimized = false
  instance_type = var.instance_type
  monitoring    = true
  key_name      = var.key_pair
  subnet_id     = aws_subnet.subnet-public.id
  user_data     = file("syslog.sh")

  vpc_security_group_ids = [
    aws_security_group.syslog-sg.id,
  ]

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_type = "gp2"
    volume_size = var.root_vol_size
  }

  # Add the rsyslog.conf file to the new server
  provisioner "file" {
    source = "rsyslog_server.conf"
    destination = "/etc/rsyslog.d/rsyslog_server.conf"
  }
}

resource "aws_eip" "syslog-eip" {
  vpc      = true
  instance = aws_instance.syslog.id
}