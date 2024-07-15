# create vpc for IBM

resource "aws_vpc" "ibm_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "ibm-vpc"
  }
}

#create subnet 

resource "aws_subnet" "ibm_public_sn" {
  vpc_id     = aws_vpc.ibm_vpc.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "ibm-web-sn"
  }
}

resource "aws_subnet" "ibm_app_sn" {
  vpc_id     = aws_vpc.ibm_vpc.id
  cidr_block = "10.0.16.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "ibm-app-sn"
  }
}
#create private subnet
resource "aws_subnet" "ibm_private_sn" {
  vpc_id     = aws_vpc.ibm_vpc.id
  cidr_block = "10.0.32.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "ibm-db-sn"
  }
}
# create internet gateways
resource "aws_internet_gateway" "ibm_gw" {
  vpc_id = aws_vpc.ibm_vpc.id

  tags = {
    Name = "ibm-gw"
  }
}
#create route tables public
resource "aws_route_table" "ibm_web_rt" {
  vpc_id = aws_vpc.ibm_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ibm_gw.id
  }

  tags = {
    Name = "ibm-web-rt"
  }
}

resource "aws_route_table" "ibm_app_rt" {
  vpc_id = aws_vpc.ibm_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ibm_gw.id
  }

  tags = {
    Name = "ibm-app-rt"
  }
}

#create route table for private
resource "aws_route_table" "ibm_db_rt" {
  vpc_id = aws_vpc.ibm_vpc.id

  tags = {
    Name = "ibm-db-rt"
  }
}
#subnet association public
resource "aws_route_table_association" "ibm_web_asso" {
  subnet_id      = aws_subnet.ibm_public_sn.id
  route_table_id = aws_route_table.ibm_web_rt.id
}
resource "aws_route_table_association" "ibm_app_asso" {
  subnet_id      = aws_subnet.ibm_app_sn.id
  route_table_id = aws_route_table.ibm_app_rt.id
}
# subnet association pvt
resource "aws_route_table_association" "ibm_db_asso" {
  subnet_id      = aws_subnet.ibm_private_sn.id
  route_table_id = aws_route_table.ibm_db_rt.id
}
#create nacl for public
resource "aws_network_acl" "ibm_web_nacl" {
  vpc_id = aws_vpc.ibm_vpc.id

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
    Name = "ibm-web-nacl"
  }
}








