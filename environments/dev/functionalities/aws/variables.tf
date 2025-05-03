variable "region" {
  description = "The AWS region"
  type        = string
  default     = ""
}

variable "project" {
  description = "The name of project"
  type        = string
}

variable "account_id" {
  description = "The AWS account ID"
  type        = string
}

variable "domain_name" {
  type        = string
  description = "The value of domain"
}
