module "environment" {
  source = "../modules/opencode_environment"

  environment      = var.environment
  revision         = var.revision
  release_id       = var.release_id
  image_repository = var.image_repository

  # Target topology: two web tasks on one Swarm manager, with no extra nodes.
  desired_replicas = var.desired_replicas
  manager_count    = var.manager_count
  worker_count     = var.worker_count
}
