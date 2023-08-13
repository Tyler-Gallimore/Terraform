resource "aws_security_group" "apache_sg" {
  name   = "Allow SSH and network traffic"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    description = "SSH from IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["IP Address"]
  }

  ingress {
    description = "HTTP Traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_traffic"
  }
}

resource "aws_security_group" "mysql_sg" {
  name   = "Allow SSH and  MySQL network traffic"
  vpc_id = aws_vpc.project_vpc.id

  ingress {
    description     = "Allows incoming MySQL traffic"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.apache_sg.id]
  }
}