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

resource "aws_instance" "InstanceName" {
    ami = "ami-05548f9cecf47b442"
    instance_type = "t2.micro"
    #subnet_id = "public subnet"
    #vpc_security_group_ids = "SG id"
    tags = {
        Name = "HelloWorld"
    }
}

#Notes:
#Use terraform validate to check code before deployment
#terraform write is creating the code and pushing to Github
#terraform init once configeration file is created
#terraform plan shows what will be performed
#terraform apply to execute the code
#terraform destroy to delete all resources created with terraform
