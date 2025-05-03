variable "project" {
  type        = string
  description = "Name of the project"
}

variable "queue_name" {
  description = "Name of the SQS"
  default     = ""
}

variable "timeout" {
  description = "Amount of time your Lambda Function has to run in seconds. Defaults to 3."
  default     = 30
}

variable "source_arn" {
  description = "Source ARN to received message."
  default     = ""
}

variable "dead_letter_queue_arn" {
  description = "Dead letter queue ARN."
  default     = ""
}

variable "dead_letter_queue_max_receive_count" {
  description = "Dead letter queue max receive count."
  default     = 3
}
