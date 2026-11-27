terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    opencode = {
      source  = "opencode/opencode"
      version = "~> 0.1"
    }
  }

  # Separate state boundary from staging. Bucket, key, region, and lock table
  # are supplied by environment-scoped bindings in opencode-deploy.yml.
  backend "s3" {}
}

provider "opencode" {}
