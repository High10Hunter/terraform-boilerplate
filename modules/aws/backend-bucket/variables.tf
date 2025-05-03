variable "project" {
  description = "Name of the project"
  type        = string
}

variable "backend_bucket_name" {
  description = "Name of the backend bucket"
  type        = string
}

variable "principal_arns" {
  description = "A list of principal arns allowed to assume the IAM role"
  default     = null
  type        = list(string)
}
