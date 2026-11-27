variable "environment" {
  description = "Target GitHub environment and runtime scope."
  type        = string

  validation {
    condition     = contains(["staging", "production"], var.environment)
    error_message = "environment must be one of: staging, production."
  }
}

variable "revision" {
  description = "Exact 40-character commit SHA being released."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{40}$", var.revision))
    error_message = "revision must be a full 40-character lowercase Git SHA."
  }
}

variable "release_id" {
  description = "Release identifier carried through Terraform and the GitHub deployment receipt."
  type        = string

  validation {
    condition     = length(trimspace(var.release_id)) > 0
    error_message = "release_id must not be empty."
  }
}

variable "aws_account_id" {
  description = "AWS account this environment must be applied in; guards against wrong-account credentials."
  type        = string

  validation {
    condition     = can(regex("^[0-9]{12}$", var.aws_account_id))
    error_message = "aws_account_id must be a 12-digit AWS account ID."
  }
}

variable "site_index_path" {
  description = "Path to the static site index.html uploaded for this release."
  type        = string
}

variable "price_class" {
  description = "CloudFront price class."
  type        = string
  default     = "PriceClass_100"

  validation {
    condition     = contains(["PriceClass_100", "PriceClass_200", "PriceClass_All"], var.price_class)
    error_message = "price_class must be PriceClass_100, PriceClass_200, or PriceClass_All."
  }
}
