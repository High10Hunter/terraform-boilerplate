resource "aws_sqs_queue" "this" {
  name                       = "${local.base_name}-${var.queue_name}"
  delay_seconds              = 0
  visibility_timeout_seconds = var.timeout
  policy                     = data.aws_iam_policy_document.sql_role_queue.json
  redrive_policy = var.dead_letter_queue_arn != "" ? jsonencode({
    deadLetterTargetArn = var.dead_letter_queue_arn
    maxReceiveCount     = var.dead_letter_queue_max_receive_count
  }) : null
  tags = {
    Enviroment = local.base_name
  }
}
