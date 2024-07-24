# create vpc for IBM

resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.Name
  }
}

#create subnet 

resource "aws_subnet" "public_sn" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_sn_cidr_block
  availability_zone = "us-east-1a"
  map_public_ip_on_launch= "true"

  tags = {
    Name = var.public_sn_Name
  }
}

resource "aws_subnet" "app_sn" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.app_sn_cidr_block
  availability_zone = "us-east-1b"
  map_public_ip_on_launch= "true"

  tags = {
    Name = var.app_sn_Name
  }
}
#create private subnet
resource "aws_subnet" "private_sn" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_sn_cidr_block
  availability_zone = "us-east-1c"
  map_public_ip_on_launch="false"

  tags = {
    Name = var.private_sn_cidr_block
  }
}
# create internet gateways
resource "aws_internet_gateway" "vpc_gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.vpc_gw_Name
  }
}
#create route tables public
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_gw.id
  }

  tags = {
    Name = var.public_rt_Name
  }
}

resource "aws_route_table" "app_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_gw.id
  }

  tags = {
    Name = var.app_rt_Name
  }
}

#create route table for private
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.private_rt_Name
  }
}
#subnet association public
resource "aws_route_table_association" "ibm_web_asso" {
  subnet_id      = aws_subnet.public_sn.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "ibm_app_asso" {
  subnet_id      = aws_subnet.app_sn.id
  route_table_id = aws_route_table.app_rt.id
}
# subnet association pvt
resource "aws_route_table_association" "ibm_db_asso" {
  subnet_id      = aws_subnet.private_sn.id
  route_table_id = aws_route_table.private_rt.id
}
#create nacl for public
resource "aws_network_acl" "public_nacl" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = var.public_nacl_Name
  }
}
#subnet association nacl for web
resource "aws_network_acl_association" "ibm_nacl_association" {
  network_acl_id = aws_network_acl.public_nacl.id
  subnet_id      = aws_subnet.public_sn.id
}
resource "aws_network_acl" "app_nacl" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = var.app_nacl_Name
  }
}
#subnet association nacl for web
resource "aws_network_acl_association" "ibm_app_nacl_association" {
  network_acl_id = aws_network_acl.app_nacl.id
  subnet_id      = aws_subnet.app_sn.id
}
#create nacl for pvt
resource "aws_network_acl" "private_nacl" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  tags = {
    Name = var.private_nacl_Name
  }
}
#subnet association nacl for web
resource "aws_network_acl_association" "ibm_db_nacl_association" {
  network_acl_id = aws_network_acl.private_nacl.id
  subnet_id      = aws_subnet.private_sn.id
}
#security groups for public
resource "aws_security_group" "public_sg" {
  name        = "ibm_web_sg"
  description = "Allow ssh inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = var.public_sg_Name
  }
}
#security group rule -ssh

resource "aws_vpc_security_group_ingress_rule" "allow_web_sg_ssh" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
#security group rule -http
resource "aws_vpc_security_group_ingress_rule" "allow_web_sg_http" {
  security_group_id = aws_security_group.public_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}
#App security group
#security groups for public
resource "aws_security_group" "app_sg" {
  name        = "ibm_app_sg"
  description = "Allow ssh inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = var.app_sg_Name
  }
}
#security group rule -ssh

resource "aws_vpc_security_group_ingress_rule" "allow_app_sg_ssh" {
  security_group_id = aws_security_group.app_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
#security group rule -http
resource "aws_vpc_security_group_ingress_rule" "allow_app_sg_http" {
  security_group_id = aws_security_group.app_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}
#pvt security group
#security groups for public
resource "aws_security_group" "private_sg" {
  name        = "ibm_db_sg"
  description = "Allow ssh inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = var.private_sg_Name
  }
}
#security group rule -ssh

resource "aws_vpc_security_group_ingress_rule" "allow_db_sg_ssh" {
  security_group_id = aws_security_group.private_sg.id
  cidr_ipv4         = "10.0.0.0/16"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
#security group rule -postgres
resource "aws_vpc_security_group_ingress_rule" "allow_db_sg_postgres" {
  security_group_id = aws_security_group.private_sg.id
  cidr_ipv4         = "10.0.0.0/16"
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432
}














