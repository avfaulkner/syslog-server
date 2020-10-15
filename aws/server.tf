resource "aws_key_pair" "ssh-key" {
  key_name   = "syslog-key"
  public_key = var.public_key
}

resource "aws_instance" "syslog" {
  ami           = var.ami != "" ? var.ami : data.aws_ami.syslog.id
  ebs_optimized = false
  instance_type = var.instance_type
  monitoring    = true
  key_name      = aws_key_pair.ssh-key.id
  subnet_id     = aws_subnet.subnet-public.id
  user_data     = data.template_file.user_data.id
  availability_zone = "${var.region}a"

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
}

resource "aws_eip" "syslog-eip" {
  vpc      = true
  instance = aws_instance.syslog.id
}