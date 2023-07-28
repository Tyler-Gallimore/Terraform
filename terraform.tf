terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
    http = {
      source = "hashicorp/http"
      version = "2.1.0"
    }
  }
}

#Used to pin a certain version of terraform
