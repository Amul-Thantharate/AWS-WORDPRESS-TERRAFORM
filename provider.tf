terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
        }
        null = {
        source  = "hashicorp/null"
        version = "~> 3.0"
        }
        tls = {
        source  = "hashicorp/tls"
        version = "~> 3.0"
        }
        local = {
        source  = "hashicorp/local"
        version = "~> 2.1"
        }
    }
    required_version = ">= 0.14"
    
}

provider "aws" {
    region = var.region
}