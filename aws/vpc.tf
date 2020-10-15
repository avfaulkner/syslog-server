# VPC
resource "aws_vpc" "syslog" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "syslog"
  }
}

resource "aws_route_table" "syslog-rt" {
  vpc_id = aws_vpc.syslog.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "rt-public"
  }
}

resource "aws_route_table_association" "rt-assoc" {
  route_table_id = aws_route_table.syslog-rt.id
//  gateway_id = aws_internet_gateway.igw.id
  subnet_id = aws_subnet.subnet-public.id
}

resource "aws_route_table" "syslog-rt-private" {
  vpc_id = aws_vpc.syslog.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "rt-private"
  }
}


resource "aws_subnet" "subnet-public" {
  cidr_block = "10.0.10.0/24"
  vpc_id     = aws_vpc.syslog.id
  map_public_ip_on_launch = true
  depends_on = [aws_internet_gateway.igw]
  availability_zone = "${var.region}a"

  tags = {
    Name = "syslog-public"
  }
}

resource "aws_subnet" "subnet-private" {
  cidr_block = "10.0.11.0/24"
  vpc_id     = aws_vpc.syslog.id

  tags = {
    Name = "syslog-private"
  }
}

#public
# public eip is in server.tf
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.syslog.id

  tags = {
    Name = "syslog-igw"
  }
}

#nat
resource "aws_eip" "eip-nat" {
  vpc = true

  tags = {
    Name = "syslog-eip-nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip-nat.id
  subnet_id     = aws_subnet.subnet-private.id

  tags = {
    Name = "syslog-nat-gw"
  }
}