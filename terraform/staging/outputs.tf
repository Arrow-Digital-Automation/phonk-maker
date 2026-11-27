output "app_url" {
  description = "Live staging HTTPS URL."
  value       = module.environment.app_url
}

output "verification_url" {
  description = "Staging HTTPS release-marker URL."
  value       = module.environment.verification_url
}

output "revision" {
  value = module.environment.revision
}

output "release_id" {
  value = module.environment.release_id
}

output "desired_replicas" {
  value = module.environment.desired_replicas
}

output "manager_count" {
  value = module.environment.manager_count
}

output "worker_count" {
  value = module.environment.worker_count
}
