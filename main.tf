terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
}

data "aws_key_pair" "existing_key_pair" {
  key_name = "LUIT"
}
resource "aws_instance" "Jenkins_server" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.Jenkins.name]
    key_name = data.aws_key_pair.existing_key_pair.key_name
    user_data = file("Jenkins.sh")
    tags = {
        Name = "Jenkins Web"
    }
}

resource "aws_security_group" "Jenkins" {
    name = "Allow SSH and network traffic"
    vpc_id = "vpc-0e91d041ce7c92c5c"
    
    ingress {
        description = "SSH from IP"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["35.145.180.2/32"]
    }
    
    ingress {
        description = "TCP traffic to 8080"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
        Name = "allow_traffic"
    }
}

resource "aws_s3_bucket" "Jenkins_bucket" {
    
}

#Notes:
#Use terraform validate to check code before deployment
#terraform write is creating the code and pushing to Github
#terraform init once configeration file is created
#terraform plan shows what will be performed
#terraform apply to execute the code
#terraform destroy to delete all resources created with terraform
