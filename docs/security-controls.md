# Security Controls

## S3 Hardening

| Control | Implementation |
| --- | --- |
| Block public access | `aws_s3_bucket_public_access_block` blocks public ACLs and public bucket policies |
| Disable ACL-based ownership risk | `BucketOwnerEnforced` object ownership on the secure bucket |
| Encrypt at rest | `aws_s3_bucket_server_side_encryption_configuration` with AWS KMS |
| KMS rotation | `aws_kms_key.enable_key_rotation = true` |
| Require TLS | Bucket policy denies requests when `aws:SecureTransport` is false |
| Require encrypted uploads | Bucket policy denies `PutObject` without `aws:kms` encryption |
| Require correct KMS key | Bucket policy denies uploads encrypted with the wrong KMS key |
| Versioning | `aws_s3_bucket_versioning` enabled |
| Access logging | Optional dedicated access log bucket |

## IAM Least Privilege

This lab creates two policies:

| Policy | Allowed Actions |
| --- | --- |
| Read-only S3 | `s3:ListBucket`, `s3:GetObject`, `s3:GetObjectTagging`, `s3:GetObjectVersion`, `kms:Decrypt` |
| Write-only S3 | `s3:PutObject`, `s3:PutObjectTagging`, `s3:AbortMultipartUpload`, `kms:Encrypt`, `kms:GenerateDataKey` |

The policies are intentionally narrow and scoped to the single hardened bucket and its KMS key.

## What Is Not Included Yet

- CloudTrail data events for object-level auditing
- AWS Config managed rules
- S3 object lock
- IAM Access Analyzer validation
- Automated remediation

Those are good follow-up improvements after the base lab works.
