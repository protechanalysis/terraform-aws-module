output "instance_profile_name" {
  description = "Name of the instance profile for EC2"
  value       = aws_iam_instance_profile.ec2_s3_profile.name
}

output "instance_profile_arn" {
  description = "ARN of the instance profile for EC2"
  value       = aws_iam_instance_profile.ec2_s3_profile.arn
}

output "role_arn" {
  description = "ARN of the IAM role for EC2"
  value       = aws_iam_role.ec2_s3_role.arn
}