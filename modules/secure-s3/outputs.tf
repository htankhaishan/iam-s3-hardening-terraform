output "bucket_name" {
  description = "Name of the hardened S3 bucket."
  value       = aws_s3_bucket.secure.id
}

output "bucket_arn" {
  description = "ARN of the hardened S3 bucket."
  value       = aws_s3_bucket.secure.arn
}

output "access_log_bucket_name" {
  description = "Name of the S3 access log bucket, if enabled."
  value       = var.enable_access_logging ? aws_s3_bucket.access_logs[0].id : null
}

output "kms_key_arn" {
  description = "ARN of the KMS key used for S3 encryption."
  value       = aws_kms_key.s3.arn
}
