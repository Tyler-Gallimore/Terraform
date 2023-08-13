provider "aws" {
  region = "us-east-1"
}

data "aws_key_pair" "existing_key_pair" {
  key_name = "key_pair"
}
resource "aws_instance" "apache_subnet_1" {
  ami             = var.ami
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.apache_sg.id]
  key_name        = data.aws_key_pair.existing_key_pair.key_name
  user_data       = var.user_data
  subnet_id       = aws_subnet.public_subnet_1.id

  tags = {
    Name = "Apache Web1"
  }
}

resource "aws_instance" "apache_subnet_2" {
  ami             = var.ami
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.apache_sg.id]
  key_name        = data.aws_key_pair.existing_key_pair.key_name
  user_data       = var.user_data
  subnet_id       = aws_subnet.public_subnet_2.id

  tags = {
    Name = "Apache Web2"
  }
}