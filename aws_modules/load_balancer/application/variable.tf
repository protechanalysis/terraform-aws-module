variable "vpc_id" {
  description = "The ID of the VPC where the RDS instance will be created."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the RDS instance will be created."
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "The name prefix for the load balancer and target group."
  type        = string
}

variable "s3_log_bucket_id" {
  description = "The ID of the S3 bucket for storing access logs."
  type        = string
}

variable "alb_sg_id" {
  description = "The security group ID for the Application Load Balancer."
  type        = list(string)
}