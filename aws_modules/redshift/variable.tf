variable "name" {
  description = "The name of the Redshift cluster"
  type        = string
}

variable "database_name" {
  description = "The name of the database to create when the cluster is created"
  type        = string
}

variable "master_username" {
  description = "The username associated with the master user account for the cluster"
  type        = string
}

variable "master_password" {
  description = "The password associated with the master user account for the cluster"
  type        = string
}

variable "port" {
  description = "The port number on which the cluster accepts incoming connections"
  type        = number
  default     = 5439
}

variable "node" {
  description = "The node type to be provisioned for the cluster"
  type        = string
  default     = "dc1.large"
}

variable "cluster" {
  description = "The type of cluster to create"
  type        = string
  default     = "single-node"
}

variable "cluster_security_groups" {
  description = "A list of security groups to be associated with the cluster"
  type        = list(string)
  default     = []
}

variable "multi_az" {
  description = "Whether to create a multi-AZ cluster (only valid for multi-node clusters)"
  type        = bool
  default     = false
}

variable "relocation" {
  description = "Whether to enable availability zone relocation"
  type        = bool
  default     = false
}

variable "skip_snapshot" {
  description = "Whether to skip the final snapshot when the cluster is deleted"
  type        = bool
  default     = true
}

variable "iam_role_redshift_arn" {
  description = "The ARNs of IAM roles to associate with the Redshift cluster"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the Redshift subnet group"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to the Redshift cluster and subnet group"
  type        = map(string)
}

variable "public_access" {
  description = "Whether the Redshift cluster should be publicly accessible"
  type        = bool
  default     = false
}

variable "version" {
  description = "The version of the Redshift cluster"
  type        = string
}

variable "number_of_nodes" {
  description = "The number of nodes in the Redshift cluster"
  type        = number
  default     = 1
  validation {
    condition     = var.cluster != "multi-node" || var.number_of_nodes > 1
    error_message = "number_of_nodes must be greater than 1 for multi-node clusters."
  }
}
