terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    opencode = {
      source  = "opencode/opencode"
      version = "~> 0.1"
    }
  }
}
