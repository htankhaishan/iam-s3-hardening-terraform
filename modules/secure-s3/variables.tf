variable "project_name" {
  description = "Project name used in resource names."
  type        = string
}

variable "environment" {
  description = "Environment label used in resource names."
  type        = string
}

variable "force_destroy" {
  description = "Whether Terraform may delete non-empty buckets."
  type        = bool
}

variable "enable_access_logging" {
  description = "Whether to create and use an S3 access logging bucket."
  type        = bool
}

variable "allowed_read_principal_arns" {
  description = "IAM principal ARNs allowed to read from the secure bucket."
  type        = list(string)
}

variable "allowed_write_principal_arns" {
  description = "IAM principal ARNs allowed to write to the secure bucket."
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to supported resources."
  type        = map(string)
  default     = {}
}
