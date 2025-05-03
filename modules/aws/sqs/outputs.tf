output "sqs_arn" {
  description = "ARN of the SQS."
  value       = aws_sqs_queue.event_queue.arn
}
output "sqs_id" {
  description = "The SQS capture job execution action id."
  value       = aws_sqs_queue.event_queue.id
}
