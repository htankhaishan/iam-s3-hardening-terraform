data "aws_iam_policy_document" "readonly_s3" {
  statement {
    sid    = "ReadOnlyBucketAccess"
    effect = "Allow"

    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket"
    ]

    resources = [
      var.secure_bucket_arn
    ]
  }

  statement {
    sid    = "ReadOnlyObjectAccess"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:GetObjectTagging",
      "s3:GetObjectVersion"
    ]

    resources = [
      "${var.secure_bucket_arn}/*"
    ]
  }

  statement {
    sid    = "DecryptObjectsOnly"
    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:DescribeKey"
    ]

    resources = [
      var.secure_bucket_kms_key_arn
    ]
  }
}

data "aws_iam_policy_document" "writeonly_s3" {
  statement {
    sid    = "ListBucketForWritePath"
    effect = "Allow"

    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket"
    ]

    resources = [
      var.secure_bucket_arn
    ]
  }

  statement {
    sid    = "WriteObjectsOnly"
    effect = "Allow"

    actions = [
      "s3:AbortMultipartUpload",
      "s3:PutObject",
      "s3:PutObjectTagging"
    ]

    resources = [
      "${var.secure_bucket_arn}/*"
    ]
  }

  statement {
    sid    = "EncryptObjectsOnly"
    effect = "Allow"

    actions = [
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:GenerateDataKey"
    ]

    resources = [
      var.secure_bucket_kms_key_arn
    ]
  }
}

resource "aws_iam_policy" "readonly_s3" {
  name        = "${var.project_name}-readonly-s3"
  description = "Least-privilege read-only access to the hardened S3 bucket."
  policy      = data.aws_iam_policy_document.readonly_s3.json

  tags = var.tags
}

resource "aws_iam_policy" "writeonly_s3" {
  name        = "${var.project_name}-writeonly-s3"
  description = "Least-privilege write-only access to the hardened S3 bucket."
  policy      = data.aws_iam_policy_document.writeonly_s3.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "readonly" {
  for_each = toset(var.allowed_read_principal_arns)

  role       = element(split("/", each.value), length(split("/", each.value)) - 1)
  policy_arn = aws_iam_policy.readonly_s3.arn
}

resource "aws_iam_role_policy_attachment" "writeonly" {
  for_each = toset(var.allowed_write_principal_arns)

  role       = element(split("/", each.value), length(split("/", each.value)) - 1)
  policy_arn = aws_iam_policy.writeonly_s3.arn
}
