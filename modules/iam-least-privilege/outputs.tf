output "readonly_policy_arn" {
  description = "ARN of the least-privilege read-only IAM policy."
  value       = aws_iam_policy.readonly_s3.arn
}

output "writeonly_policy_arn" {
  description = "ARN of the least-privilege write-only IAM policy."
  value       = aws_iam_policy.writeonly_s3.arn
}
