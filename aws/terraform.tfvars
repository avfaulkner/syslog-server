owner         = "af" # your name
aws_account = "988769628162" # aws 12 digit account number without dashes
region        = "us-east-2"
aws_profile   = "" # add the file path to the aws credentials or leave blank and export them to the env
instance_type = "t2.xlarge"
root_vol_size = 64
instance_name = "syslog"
ssh_cidr_blocks = [
  "172.103.164.222/32" # Place appropriate cidr blocks as a list of strings here
]
ami = "" # syslog 8 base ami for us-east-2 region
# See this link for syslog AMIs for other regions: https://wiki.syslog.org/Cloud/AWS

# Add one of the following:
key_pair      = "~/.ssh/cac-test-kp.pem" # Place instance key pair here
public_key = ""