# role with the permissions needed for the ECS execution 
resource "aws_iam_role" "ecs_execution" {
  name               = "${local.base_name}-ecs-execution-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume.json
}


resource "aws_iam_instance_profile" "ecs_execution" {
  name = "${local.base_name}-ecs-execution-profile"
  role = aws_iam_role.ecs_execution.name
}


resource "aws_iam_role_policy" "ecs_execution" {
  name = "${local.base_name}-ecs-execution-policy"
  role = aws_iam_role.ecs_execution.id

  policy = data.aws_iam_policy_document.ecs_execution_policy.json
}

# role with the permissions needed for the ECS task
resource "aws_iam_role" "ecs_task" {
  name               = var.ecs_task_role_name
  assume_role_policy = data.aws_iam_policy_document.ecs_task_assume.json
}

resource "aws_iam_role_policy" "ecs_task" {
  name = var.ecs_task_policy_name
  role = aws_iam_role.ecs_task.id

  policy = data.aws_iam_policy_document.ecs_task_policy.json
}
