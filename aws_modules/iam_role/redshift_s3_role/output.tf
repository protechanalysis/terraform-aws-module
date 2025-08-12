output "redshift_s3_role_arn" {
  description = "The ARN of the Redshift S3 role"
  value       = aws_iam_role.redshift_role.arn
}