output "app_url" {
  description = "HTTPS application URL for the deployed environment."
  value       = coalesce(try(opencode_service.web.url, null), try(opencode_service.web.endpoint, null))
}

output "verification_url" {
  description = "HTTPS release-marker URL used to verify the exact revision and release ID."
  value       = "${trimSuffix(output.app_url.value, "/")}${local.release_marker_path}"
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
