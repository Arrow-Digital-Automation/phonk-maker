terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.80"
    }
  }

  # Separate state boundary from staging. Bucket, key, region, and lock table
  # are supplied by environment-scoped bindings in opencode-deploy.yml.
  backend "s3" {}
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "phonk-maker"
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}
