resource "aws_vpc" "lms_vpc" {
  cidr_block       = "0.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "lms_vpc"
  }
}
