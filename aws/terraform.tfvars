owner         = "" # your name
aws_account = "" # aws 12 digit account number without dashes
region        = ""
aws_profile   = "" # add the file path to the aws credentials or leave blank and export them to the env
instance_type = ""
root_vol_size = 64
instance_name = "syslog"
ssh_cidr_blocks = [
  "" # Place appropriate cidr blocks as a list of strings here
]

# Add the public ssh key material as a string:
public_key = "" # key starting with ssh-rsa...

# Add one of the following (priority is given to the ami variable):
ami = "" #  base ami for your chosen region
# See this link for syslog AMIs for other regions: https://wiki.syslog.org/Cloud/AWS
marketplace_ami_name = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"