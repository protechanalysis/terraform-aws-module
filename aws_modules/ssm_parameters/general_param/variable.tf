variable "parameters" {
  type = map(object({
    description = string
    type        = string
    value       = string
  }))
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "dev"
    Project     = "airflow"
  }
}