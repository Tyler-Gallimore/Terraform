terraform {
    backend "s3" {
        bucket = "terraform-apache-blueteam2023"
        region = "us-east-1"
        key = "terraform.tfstate"
    }
}