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

variable "image_repository" {
  description = "Production ECR repository base URL; supplied by an environment-scoped binding."
  type        = string

  validation {
    condition     = length(trimspace(var.image_repository)) > 0
    error_message = "image_repository must not be empty."
  }
}

variable "desired_replicas" {
  description = "Two web instances on the single Swarm manager."
  type        = number
  default     = 2

  validation {
    condition     = var.desired_replicas == 2
    error_message = "Production must run exactly two web replicas."
  }
}

variable "manager_count" {
  description = "Single Swarm manager; do not add manager nodes."
  type        = number
  default     = 1

  validation {
    condition     = var.manager_count == 1
    error_message = "Production must keep exactly one Swarm manager."
  }
}

variable "worker_count" {
  description = "No extra Swarm nodes; both replicas run on the one manager."
  type        = number
  default     = 0

  validation {
    condition     = var.worker_count == 0
    error_message = "Production must not add Swarm worker nodes."
  }
}
