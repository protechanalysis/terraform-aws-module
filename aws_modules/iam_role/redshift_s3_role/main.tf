# Get current region and account ID
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_iam_role" "redshift_role" {
  name = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "redshift.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy" "redshift_s3_policy" {
  name = "${var.name}-redshift-s3-policy"
  role = aws_iam_role.redshift_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject",
        ]
        Resource = [
            "arn:aws:s3:::${var.bucket_name}-bucket",
            "arn:aws:s3:::${var.bucket_name}-bucket/*",
        ]
      }
    ]
  })
}
