#!/usr/bin/env bash

sudo yum update -y
sudo yum install rsyslog -y

sudo yum install -y policycoreutils setroubleshoot
sudo semanage port -m -t syslogd_port_t -p tcp 514
sudo semanage port -a -t syslogd_port_t -p tcp 2514

sudo systemctl enable rsyslog.service
sudo systemctl start rsyslog.service