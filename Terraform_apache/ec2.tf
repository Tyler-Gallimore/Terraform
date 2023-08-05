provider "aws" {
  region = var.region
}

data "aws_key_pair" "existing_key_pair" {
  key_name = "LUIT"
}
resource "aws_autoscaling_group" "apache" {
  availability_zones = ["us-east-1a", "us-east-1b"]
  max_size           = 5
  min_size           = 2

  launch_template {
    id      = aws_launch_template.apache_web.id
    version = aws_launch_template.apache_web.latest_version
  }
}
resource "aws_launch_template" "apache_web" {
  name_prefix            = "apache_web"
  image_id               = var.ami
  instance_type          = "t2.micro"
  key_name               = data.aws_key_pair.existing_key_pair.key_name
  user_data              = var.user_data
  vpc_security_group_ids = [aws_security_group.apache.id]
}
