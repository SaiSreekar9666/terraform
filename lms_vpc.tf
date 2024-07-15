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
  cidr_block = "10.0.15.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "ibm-app-sn"
  }
}

