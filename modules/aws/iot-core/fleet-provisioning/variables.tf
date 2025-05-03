variable "project" {
  description = "The name of project."
  type        = string
}

variable "region" {
  description = "The region aws"
  type        = string
}

variable "account_id" {
  description = "The account ID aws"
  type        = string
}

variable "lambda_function_arn" {
  type        = string
  description = "Function arn"
}
