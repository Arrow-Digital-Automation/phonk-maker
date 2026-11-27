variable "environment" {
  description = "Staging is the only valid environment for this root."
  type        = string
  default     = "staging"

  validation {
    condition     = var.environment == "staging"
    error_message = "terraform/staging is reserved for the staging environment."
  }
}

variable "revision" {
  description = "Exact 40-character commit SHA to serve in staging."
  type        = string

  validation {
    condition     = can(regex("^[0-9a-f]{40}$", var.revision))
    error_message = "revision must be a full 40-character lowercase Git SHA."
  }
}

variable "release_id" {
  description = "Release ID for the staging deployment receipt."
  type        = string

  validation {
    condition     = length(trimspace(var.release_id)) > 0
    error_message = "release_id must not be empty."
  }
}

variable "image_repository" {
  description = "Staging ECR repository base URL; supplied by an environment-scoped binding."
  type        = string

  validation {
    condition     = length(trimspace(var.image_repository)) > 0
    error_message = "image_repository must not be empty."
  }
}

variable "desired_replicas" {
  description = "Single staging web instance."
  type        = number
  default     = 1

  validation {
    condition     = var.desired_replicas == 1
    error_message = "Staging must run exactly one web replica."
  }
}

variable "manager_count" {
  description = "Single Swarm manager; no manager nodes are added."
  type        = number
  default     = 1

  validation {
    condition     = var.manager_count == 1
    error_message = "Staging must keep exactly one Swarm manager."
  }
}

variable "worker_count" {
  description = "No extra Swarm nodes."
  type        = number
  default     = 0

  validation {
    condition     = var.worker_count == 0
    error_message = "Staging must not add Swarm worker nodes."
  }
}
