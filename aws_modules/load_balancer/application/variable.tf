variable "vpc_id" {
  description = "The ID of the VPC where the alb instance will be created."
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the alb instance will be created."
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
  default     = ""
}

variable "alb_sg_id" {
  description = "The security group ID for the Application Load Balancer."
  type        = list(string)
}

variable "health_check_path" {
  description = "The health check path for the target group."
  type        = string
  default     = "/index.html"
}

variable "enable_log" {
  description = "Enable or disable access logging for the ALB."
  type        = bool
  default     = false
  
}

variable "instance_ids" {
  description = "A set of instance IDs to attach to the target group."
  type = map(string)
  default = {}
}

variable "target_port" {
  description = "The port on which the load balancer target group will route traffic."
  type        = number
}

variable "protocol" {
  description = "The protocol for the load balancer and target group (e.g., HTTP, HTTPS)."
  type        = string
}

variable "listener_port" {
  description = "The port on which the load balancer will listen."
  type        = number
}

variable "enable_stickiness" {
  description = "Enable or disable stickiness for the target group."
  type        = bool
  default     = false
}

variable "cookie_duration" {
  description = "The duration (in seconds) for which the stickiness cookie should be valid."
  type        = number
  default     = null
  validation {
    condition     = var.enable_stickiness == false || (var.enable_stickiness == true && var.cookie_duration != null && var.cookie_duration > 0)
    error_message = "cookie_duration must be specified and greater than 0 when stickiness is enabled."
  }
}