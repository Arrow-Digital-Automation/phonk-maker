output "app_url" {
  description = "HTTPS application URL for the deployed environment."
  value       = local.app_url
}

output "verification_url" {
  description = "HTTPS release-marker URL used to verify the exact revision and release ID."
  value       = "${local.app_url}${local.release_marker_path}"
}

output "revision" {
  description = "Exact revision requested for this deployment."
  value       = var.revision
}

output "release_id" {
  description = "Release ID requested for this deployment."
  value       = var.release_id
}

output "bucket_name" {
  description = "Private S3 bucket holding the static site."
  value       = aws_s3_bucket.site.id
}

output "distribution_id" {
  description = "CloudFront distribution ID serving the site."
  value       = aws_cloudfront_distribution.site.id
}
