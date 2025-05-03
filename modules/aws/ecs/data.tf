data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "ecs_task_assume" {
  version = "2012-10-17"
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
    effect = "Allow"
    sid    = "EcsTaskAssumeRole"
  }
}

data "aws_iam_policy_document" "ecs_task_policy" {
  version = "2012-10-17"
  statement {
    actions = [
      "s3:*",
      "ses:*",
      "sqs:*",
      "iot:*",
      "events:DescribeRule",
      "athena:*",
      "iam:*",
      "sts:*",
      "glue:*",
      "execute-api:*",
      "ecs:*",
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "ecs_execution_policy" {
  version = "2012-10-17"

  statement {
    actions = [
      "ecs:DeregisterContainerInstance",
      "ecs:DiscoverPollEndpoint",
      "ecs:Poll",
      "ecs:RegisterContainerInstance",
      "ecs:StartTelemetrySession",
      "ecs:Submit*",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetAuthorizationToken",
      "ecr:*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    actions = [
      "ssm:GetParameters",
      "kms:Decrypt",
    ]
    effect = "Allow"
    resources = [
      "arn:aws:ssm:${var.region}:${data.aws_caller_identity.current.account_id}:parameter/${terraform.workspace}/${var.project}_*",
      "arn:aws:kms:${var.region}:${data.aws_caller_identity.current.account_id}:key/*",
    ]
  }

  statement {
    actions = [
      "cloudwatch:*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}
