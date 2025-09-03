variable "length" {
  description = "The length of the generated string. Must be between 8 and 32."
  type        = number
  validation {
    condition     = var.length >= 8 && var.length <= 32
    error_message = "Length must be between 8 and 32"
  }
}

variable "special" {
  description = "Whether to include special characters in the generated string."
  type        = bool
  default     = false
}

variable "numeric" {
  description = "Whether to include numeric characters in the generated string."
  type        = bool
  default     = false
}

variable "override_special" {
  description = "A string of special characters to use instead of the default set."
  type        = string
  default     = "!%$&"
  validation {
    condition     = var.special == false || (var.special == true && length(var.override_special) > 0)
    error_message = "override_special must not be empty when special = true."
  }
}