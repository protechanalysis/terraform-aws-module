variable "subnet_id" {
  description = "subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "key_pair" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "ssh_allowed_cidr_blocks" {
  description = "List of CIDR blocks allowed to SSH into the instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Additional tags for the resources"
  type        = map(string)
  default     = {}
}

variable "security_group_id" {
  description = "ID of the security group to associate with the EC2 instance"
  type        = list(string)
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
}

variable "instance_profile_name" {
  description = "IAM instance profile name to attach to the EC2 instance"
  type        = string
}


variable "assign_public_ip" {
  description = "Whether to assign a public IP address to the instance"
  type        = bool
  default     = false
}