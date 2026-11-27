output "app_url" {
  description = "Staging HTTPS URL."
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

output "bucket_name" {
  value = module.environment.bucket_name
}

output "distribution_id" {
  value = module.environment.distribution_id
}
