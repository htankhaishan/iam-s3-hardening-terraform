module "secure_s3" {
  source = "./modules/secure-s3"

  project_name                 = local.project_name
  environment                  = var.environment
  force_destroy                = var.force_destroy
  enable_access_logging        = var.enable_access_logging
  allowed_read_principal_arns  = var.allowed_read_principal_arns
  allowed_write_principal_arns = var.allowed_write_principal_arns
  tags                         = local.common_tags
}

module "iam_least_privilege" {
  source = "./modules/iam-least-privilege"

  project_name                 = local.project_name
  secure_bucket_arn            = module.secure_s3.bucket_arn
  secure_bucket_kms_key_arn    = module.secure_s3.kms_key_arn
  allowed_read_principal_arns  = var.allowed_read_principal_arns
  allowed_write_principal_arns = var.allowed_write_principal_arns
  tags                         = local.common_tags
}
