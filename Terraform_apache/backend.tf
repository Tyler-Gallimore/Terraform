terraform {
#Requires S3 bucket to be created before running
    backend "s3" {
        bucket = "bucket-name"
        region = "us-east-1"
        key = "terraform.tfstate"
    }
}
