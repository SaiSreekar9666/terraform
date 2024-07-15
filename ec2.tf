resource "aws_instance" "ibm_web" {
  ami           = "ami-0a0e5d9c7acc336f1"
  instance_type = "t2.micro"
  key_name = "users"
  subnet_id     = aws_subnet.ibm_public_sn.id
  vpc_security_group_ids = [aws_security_group.ibm_web_sg.id]  
  user_data = file("app.sh")


  tags = {
    Name = "ibm_web"
  }
}