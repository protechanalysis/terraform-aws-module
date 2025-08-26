variable "subnet_ids" {
  description = "List of VPC Subnet IDs for the ElastiCache Subnet Group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of Security Group IDs to associate with the ElastiCache Cluster"
  type        = list(string)
}

variable "cache_node_type" {
  description = "The compute and memory capacity of the nodes in the node group"
  type        = string
}

variable "engine" {
  description = "The name of the cache engine to be used"
  type        = string
}

variable "engine_version" {
  description = "The version number of the cache engine to be used"
  type        = string
}

variable "multi_az_enabled" {
  description = "Specifies whether a Multi-AZ replication group is created"
  type        = bool
  default     = true
}

variable "failover" {
  description = "Specifies whether automatic failover is enabled for the replication group"
  type        = bool
  default     = true
}

variable "num_cache_clusters" {
  description = "The number of cache clusters (1 primary + replicas) in the replication group"
  type        = number
  default     = 2

  validation {
    condition     = var.num_cache_clusters >= 1 
    error_message = "num_cache_clusters must be at least 1."
  }
}

variable "parameter_group_name" {
  description = "The name of the parameter group to associate with this replication group"
  type        = string
}

variable "port" {
  description = "The port number on which Redis will accept connections"
  type        = number
  default     = 6379
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "cluster_id" {
  description = "The identifier for the replication group"
  type        = string
}
