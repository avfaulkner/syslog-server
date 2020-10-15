//output "syslog_instance" {
//  value = {
//    instance_name = var.instance_name
//    id            = aws_instance.syslog.id
//    private_ip    = aws_instance.syslog.private_ip
//
//    private_dns = aws_instance.syslog.private_dns
//
//    public_ip = aws_eip.syslog-eip.public_ip
//  }
//}

output "user_data_common" {
  value = "${data.template_file.user_data.rendered}"
}

output "syslog_instance" {
  value = aws_instance.syslog
}

output "vpc" {
  value = aws_vpc.syslog
}

output "security_group" {
  value = aws_security_group.syslog-sg
}