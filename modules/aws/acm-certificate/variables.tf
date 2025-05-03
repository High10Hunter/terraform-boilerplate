variable "domain_name" {
  type        = string
  description = "Domain name."
}

variable "validation_method" {
  type        = string
  description = "Validate method for certification."
}

variable "create_before_destroy" {
  description = "Lifecycle to create certification before destroy."
}
