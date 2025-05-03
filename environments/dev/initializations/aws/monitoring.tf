
# module "lambda_function_monitoring_billing" {
#   source = "terraform-aws-modules/lambda/aws"

#   function_name = "${var.project}-${terraform.workspace}-monitoring-billing"
#   description   = "AWS Lambda monitoring billing"
#   handler       = "main.lambda_handler"
#   runtime       = "python3.12"
#   timeout       = 40
#   publish       = true
#   environment_variables = {
#     "SLACK_WEBHOOK_URL" = var.monitoring_slack_webhook_url
#   }

#   source_path              = "${path.module}/lambdas/monitoring-billing"
#   attach_policy_statements = true
#   policy_statements = {
#     manage_billing = {
#       effect    = "Allow",
#       actions   = ["ce:GetCostAndUsage", "iam:ListAccountAliases"],
#       resources = ["*"]
#     }
#   }
# }
# resource "aws_cloudwatch_event_rule" "event_rule_lambda" {
#   name                = "report-billing-daily"
#   description         = "Run lambda everyday 02:00 UTC"
#   schedule_expression = "cron(0 2 * * ? *)"
# }

# resource "aws_cloudwatch_event_target" "event_target_lambda" {
#   rule      = aws_cloudwatch_event_rule.event_rule_lambda.name
#   target_id = "billing_targer_id"
#   arn       = module.lambda_function_monitoring_billing.lambda_function_arn
# }

# resource "aws_lambda_permission" "allow_cloudwatch" {
#   statement_id  = "AllowExecutionFromCloudWatch"
#   action        = "lambda:InvokeFunction"
#   function_name = module.lambda_function_monitoring_billing.lambda_function_name
#   principal     = "events.amazonaws.com"
#   source_arn    = aws_cloudwatch_event_rule.event_rule_lambda.arn
# }
