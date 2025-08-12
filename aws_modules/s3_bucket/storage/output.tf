output "dev_cloud_beejan_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.dev_cloud_beejan.bucket
}

output "dev_cloud_beejan_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = aws_s3_bucket.dev_cloud_beejan.arn
}
