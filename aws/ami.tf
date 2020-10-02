data "aws_ami" "syslog" {
  most_recent = true
  owners = ["aws-marketplace"]
//  owners = [var.aws_account] # Canonical

  filter {
    name   = "name"
    values = [var.marketplace_ami_name]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}