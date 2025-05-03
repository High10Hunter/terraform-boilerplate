resource "aws_iam_instance_profile" "this" {
  name = "${var.name}-nat-instance-profile"
  role = aws_iam_role.this.name

  tags = {
    Name        = "${var.name}-nat-instance-profile"
    Environment = terraform.workspace
  }
}

resource "aws_iam_role" "this" {
  name               = "${var.name}-nat-instance-assume-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags = {
    Name        = "${var.name}-nat-instance-assume-role"
    Environment = terraform.workspace
  }
}

resource "aws_iam_role_policy_attachment" "ssm" {
  policy_arn = var.ssm_policy_arn
  role       = aws_iam_role.this.name
}

resource "aws_iam_role_policy" "eni" {
  role        = aws_iam_role.this.name
  name_prefix = "${var.name}-nat-instance-eni-attach-"
  policy      = data.aws_iam_policy_document.eni_attach_role.json
}
