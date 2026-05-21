locals {
  project_name = lower(replace(var.project_name, "_", "-"))

  common_tags = merge(
    {
      Project     = var.project_name
      ManagedBy   = "Terraform"
      Environment = var.environment
      SecurityLab = "iam-s3-hardening"
    },
    var.additional_tags
  )
}
