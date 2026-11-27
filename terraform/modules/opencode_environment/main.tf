locals {
  service_name        = "web"
  service_port        = 8080
  service_route       = "/"
  service_health_path = "/"

  # The release marker is requested from the provider so the workflow can verify
  # the exact SHA and release ID over HTTPS before publishing a deployment receipt.
  release_marker_path = "/.well-known/opencode-release.json"
}

resource "opencode_swarm" "this" {
  environment   = var.environment
  name          = "phonk-maker-${var.environment}"
  manager_count = var.manager_count
  worker_count  = var.worker_count
}

resource "opencode_service" "web" {
  environment      = var.environment
  swarm_id         = opencode_swarm.this.id
  name             = local.service_name
  image            = "${var.image_repository}:${var.revision}"
  desired_replicas = var.desired_replicas

  port        = local.service_port
  route       = local.service_route
  health_path = local.service_health_path

  release_marker {
    path       = local.release_marker_path
    revision   = var.revision
    release_id = var.release_id
  }
}
