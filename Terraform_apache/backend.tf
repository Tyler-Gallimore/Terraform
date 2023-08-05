terraform {
    backend "s3" {
        bucket = "bucket-name"
        region = "us-east-1"
        key = "terraform.tfstate"
    }
}
