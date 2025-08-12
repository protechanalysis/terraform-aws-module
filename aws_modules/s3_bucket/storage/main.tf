resource "aws_s3_bucket" "dev_cloud_beejan" {
  bucket = "${var.bucket_name}"

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "dev_cloud_beejan_version" {
  bucket = aws_s3_bucket.dev_cloud_beejan.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_cloud_beejan_encryption" {
  bucket = aws_s3_bucket.dev_cloud_beejan.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

# Block public access for VPC Flow Logs bucket
resource "aws_s3_bucket_public_access_block" "dev_cloud_beejan_public_access_block" {
  bucket = aws_s3_bucket.dev_cloud_beejan.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Lifecycle policy for VPC Flow Logs (cost optimization)
resource "aws_s3_bucket_lifecycle_configuration" "dev_cloud_beejan_lifecycle" {
  bucket = aws_s3_bucket.dev_cloud_beejan.id

  rule {
    id     = "lifecycle"
    status = "Enabled"

    filter {
    prefix = "dev_cloud_beejan/"
    }

    # Move to IA after 30 days
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    # Move to Glacier after 90 days
    transition {
      days          = 90
      storage_class = "GLACIER"
    }

    # Delete after 365 days
    expiration {
      days = 365
    }

    # Clean up incomplete multipart uploads
    abort_incomplete_multipart_upload {
      days_after_initiation = 7
    }
  }
}