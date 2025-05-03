data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "eni_attach_role" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:AttachNetworkInterface", "ec2:ModifyInstanceAttribute"]
    resources = ["*"]
  }
}
