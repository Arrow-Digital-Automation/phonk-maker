variable "environment" {
  description = "Production is the only valid environment for this root."
  type        = string
  default     = "production"

  validation {
    condition     = var.environment == "production"
    error_message = "terraform/production is reserved for the production environment."
  }
}

variable "revision" {
  description = "Exact 40-character commit SHA to serve in production."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{40}$", var.revision))
    error_message = "revision must be a full 40-character lowercase Git SHA."
  }
}

variable "release_id" {
  description = "Release ID for the production deployment receipt."
  type        = string

  validation {
    condition     = length(trimspace(var.release_id)) > 0
    error_message = "release_id must not be empty."
  }
}

variable "aws_region" {
  description = "AWS region for production resources; supplied by the environment-scoped AWS_REGION variable."
  type        = string
  default     = "us-east-2"
}

variable "aws_account_id" {
  description = "AWS account that production must be applied in."
  type        = string
  default     = "210918199836"
}

variable "price_class" {
  description = "CloudFront price class for production."
  type        = string
  default     = "PriceClass_100"
}
