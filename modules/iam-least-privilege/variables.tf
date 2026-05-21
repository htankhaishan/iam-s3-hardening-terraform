variable "project_name" {
  description = "Project name used in IAM policy names."
  type        = string
}

variable "secure_bucket_arn" {
  description = "ARN of the hardened S3 bucket."
  type        = string
}

variable "secure_bucket_kms_key_arn" {
  description = "ARN of the KMS key used by the hardened S3 bucket."
  type        = string
}

variable "allowed_read_principal_arns" {
  description = "IAM principal ARNs that should receive the read-only bucket policy."
  type        = list(string)
}

variable "allowed_write_principal_arns" {
  description = "IAM principal ARNs that should receive the write-only bucket policy."
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to supported resources."
  type        = map(string)
  default     = {}
}
