variable "aws_region" {
  description = "AWS region where the lab resources will be created."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name prefix used for lab resources."
  type        = string
  default     = "iam-s3-hardening"
}

variable "environment" {
  description = "Environment label for tags and resource names."
  type        = string
  default     = "lab"
}

variable "force_destroy" {
  description = "Whether Terraform may delete non-empty S3 buckets. Keep false outside disposable labs."
  type        = bool
  default     = false
}

variable "enable_access_logging" {
  description = "Create a dedicated S3 access log bucket and enable server access logging."
  type        = bool
  default     = true
}

variable "allowed_read_principal_arns" {
  description = "IAM principal ARNs allowed to read objects from the secure bucket."
  type        = list(string)
  default     = []
}

variable "allowed_write_principal_arns" {
  description = "IAM principal ARNs allowed to write objects to the secure bucket."
  type        = list(string)
  default     = []
}

variable "additional_tags" {
  description = "Extra tags to apply to all supported resources."
  type        = map(string)
  default     = {}
}
