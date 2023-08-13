resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = var.instance_class
  username             = var.mysql_username
  password             = var.mysql_password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnets.name
}

resource "aws_db_subnet_group" "rds_subnets" {
  subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
}