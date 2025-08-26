variable "vpc_id" {
  description = "The ID of the VPC where the endpoint will be created"
  type        = string
}

variable "route_table_id" {
  description = "The ID of the route table to associate with the VPC endpoint"
  type        = string
}

variable "name" {
  description = "Name of the VPC"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}