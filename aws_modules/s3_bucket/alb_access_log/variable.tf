variable "name" {
  description = "The name of the RDS instance."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {} 
}