data "aws_iam_policy_document" "s3_assume_role" {
  version = "2012-10-17"

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = local.principal_arns
    }

    effect = "Allow"
  }
}
