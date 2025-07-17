terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.2.0"
    }
  }
  backend "s3" {
    bucket = "dk-arch-backup-tf-state"
    key = "terraform/state/terraform.tfstate"
    region = "us-east-1"
   }
}

provider "aws" {
  region = var.region
}