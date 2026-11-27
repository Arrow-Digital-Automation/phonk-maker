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

variable "image_repository" {
  description = "Environment-scoped ECR repository base URL. The tag is the release revision."
  type        = string

  validation {
    condition     = length(trimspace(var.image_repository)) > 0
    error_message = "image_repository must not be empty."
  }
}

variable "desired_replicas" {
  description = "Desired task count for the single web service."
  type        = number

  validation {
    condition     = var.desired_replicas >= 1 && var.desired_replicas <= 6
    error_message = "desired_replicas must be between 1 and 6."
  }
}

variable "manager_count" {
  description = "Swarm manager count. This topology must keep exactly one manager."
  type        = number
  default     = 1

  validation {
    condition     = var.manager_count == 1
    error_message = "This topology requires exactly one Swarm manager; do not add manager nodes."
  }
}

variable "worker_count" {
  description = "Swarm worker count. This topology must not add extra Swarm nodes."
  type        = number
  default     = 0

  validation {
    condition     = var.worker_count == 0
    error_message = "This topology must not add Swarm worker nodes."
  }
}
