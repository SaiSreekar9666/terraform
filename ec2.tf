resource "aws_instance" "ibm_web" {
  ami           = "ami-0a0e5d9c7acc336f1"
  instance_type = "t2.micro"
  key_name = "users"
  subnet_id = aws_subnet.ibm_public_sn.id
  vpc_security_group_ids = [aws_security_group.ibm_web_sg.id]  
  user_data = file("app.sh")
 


  tags = {
    Name = "ibm_web"
  }
}
#ec2 fo app
resource "aws_instance" "ibm_app" {
  ami           = "ami-0a0e5d9c7acc336f1"
  instance_type = "t2.micro"
  key_name = "users"
  subnet_id = aws_subnet.ibm_app_sn.id
  vpc_security_group_ids = [aws_security_group.ibm_app_sg.id]  
  user_data = file("app.sh")
 


  tags = {
    Name = "ibm_app"
  }
}
#ec2 for db
resource "aws_instance" "ibm_db" {
  ami           = "ami-0a0e5d9c7acc336f1"
  instance_type = "t2.micro"
  key_name = "users"
  subnet_id = aws_subnet.ibm_private_sn.id
  vpc_security_group_ids = [aws_security_group.ibm_db_sg.id]  
  user_data = file("app.sh")
 


  tags = {
    Name = "ibm_db"
  }
}