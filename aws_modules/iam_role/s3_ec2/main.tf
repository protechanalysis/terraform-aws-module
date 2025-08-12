# Get current region and account ID
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_iam_role" "ec2_s3_role" {
  name = var.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy" "ssm_policy" {
  name = "${var.name}-s3-ec2-role"
  role = aws_iam_role.ec2_s3_role.id

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

# Create an instance profile for the role
resource "aws_iam_instance_profile" "ec2_s3_profile" {
  name = "${var.name}-ec2-s3-profile"
  role = aws_iam_role.ec2_s3_role.name
}



