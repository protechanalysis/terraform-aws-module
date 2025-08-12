variable "bucket_name" {
    description = "Name of the S3 bucket to access"
    type        = string
}

variable "tags" {
  description = "Additional tags for the resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name of the IAM role"
  type        = string
}