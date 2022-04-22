terraform {
  required_version = "= 1.1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.10.0"
    }
  }
}

provider "aws" {
  region              = var.region
  profile             = var.profile
  allowed_account_ids = var.aws_infra_account_ids
}