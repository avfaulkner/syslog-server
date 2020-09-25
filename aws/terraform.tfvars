owner         = "" # your name
aws_account = "" # aws 12 digit account number
region        = ""
aws_profile   = "" # add the file path to the aws credentials or leave blank and export them to the env
instance_type = "t2.xlarge"
root_vol_size = 64
key_pair      = "" # Place instance key pair here
instance_name = "syslog"
ssh_cidr_blocks = [
  "" # Place appropriate cidr blocks as a list of strings here
]
ami = "" # syslog 8 base ami for us-east-2 region
# See this link for syslog AMIs for other regions: https://wiki.syslog.org/Cloud/AWS
