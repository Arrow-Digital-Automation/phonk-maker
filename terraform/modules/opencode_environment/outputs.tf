output "app_url" {
  description = "HTTPS application URL for the deployed environment."
  value       = local.app_url
}

output "verification_url" {
  description = "HTTPS release-marker URL used to verify the exact revision and release ID."
  value       = "${trimSuffix(local.app_url, "/")}${local.release_marker_path}"
}

output "revision" {
  description = "Exact revision requested for this deployment."
  value       = var.revision
}

output "release_id" {
  description = "Release ID requested for this deployment."
  value       = var.release_id
}

output "desired_replicas" {
  description = "Configured desired replicas for the web service."
  value       = var.desired_replicas
}

output "manager_count" {
  description = "Configured Swarm manager count."
  value       = var.manager_count
}

output "worker_count" {
  description = "Configured Swarm worker count."
  value       = var.worker_count
}
