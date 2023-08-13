resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"

}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_1"
  }

}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_2"
  }

}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private_2"
  }

}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "public"
  }

}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = "private"
  }

}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.project_vpc.id

}

resource "aws_route" "public_subnet_1_route" {
  route_table_id         = aws_route_table.public_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id

}

resource "aws_route" "public_subnet_2_route" {
  route_table_id         = aws_route_table.public_route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id

}


resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_route.id
}


resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route.id
}