data "aws_iam_policy_document" "sql_role_queue" {
  version = "2012-10-17"

  statement {
    effect    = "Allow"
    actions   = ["sqs:SendMessage"]
    resources = ["arn:aws:sqs:*:*:${local.base_name}-${var.queue_name}"]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = ["${var.source_arn}"]
    }
  }
}
