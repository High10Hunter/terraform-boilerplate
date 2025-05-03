variable "region" {
  description = "Region to deploy the resources."
  default     = "us-east-1"
  type        = string
}

variable "project" {
  description = "Name of the project."
  default     = ""
  type        = string
}

variable "backend_bucket_name" {
  description = "Name of the backend bucket."
  default     = ""
  type        = string
}

### OIDC ###
variable "repositories" {
  description = "Repositories org."
  default     = []
  type        = list(any)
}

### Billing monitoring ##
variable "monitoring_slack_webhook_url" {
  description = "Slack webhook url for monitoring channel."
  default     = ""
  type        = string
}
