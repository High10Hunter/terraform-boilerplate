data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.state_storage.arn]
  }

  statement {
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["${aws_s3_bucket.state_storage.arn}/*"]
  }

  statement {
    actions   = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:DeleteItem"]
    resources = [aws_dynamodb_table.tf_remote_state_locking.arn]
  }
}

resource "aws_iam_policy" "s3_assume" {
  name   = "${title(var.project)}S3BackendPolicy"
  path   = "/"
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_iam_role" "s3_assume" {
  name = "${title(var.project)}S3BackendRole"

  assume_role_policy = data.aws_iam_policy_document.s3_assume_role.json
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.s3_assume.name
  policy_arn = aws_iam_policy.s3_assume.arn
}
