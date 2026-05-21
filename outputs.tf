output "secure_bucket_name" {
  description = "Name of the hardened S3 bucket."
  value       = module.secure_s3.bucket_name
}

output "secure_bucket_arn" {
  description = "ARN of the hardened S3 bucket."
  value       = module.secure_s3.bucket_arn
}

output "kms_key_arn" {
  description = "ARN of the KMS key used for bucket encryption."
  value       = module.secure_s3.kms_key_arn
}

output "readonly_policy_arn" {
  description = "ARN of the least-privilege read-only IAM policy."
  value       = module.iam_least_privilege.readonly_policy_arn
}

output "writeonly_policy_arn" {
  description = "ARN of the least-privilege write-only IAM policy."
  value       = module.iam_least_privilege.writeonly_policy_arn
}
