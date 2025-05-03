resource "aws_ecs_task_definition" "ecs_backend_task_definition" {
  family                   = var.task_definition_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = aws_iam_role.ecs_execution.arn
  task_role_arn            = aws_iam_role.ecs_task.arn
  container_definitions = jsonencode([{
    name      = var.container_name
    image     = "${var.repository_url}:latest"
    essential = true
    portMappings = [
      {
        containerPort = 80
        hostPort      = 80
      }
    ]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = var.cloudwatch_log_group_name
        awslogs-region        = var.region
        awslogs-stream-prefix = "ecs"
      }
    }
    }
  ])

  depends_on = [aws_iam_role.ecs_task]
}

resource "aws_ecs_service" "ecs_backend_service" {
  name            = var.backend_service_name
  cluster         = var.ecs_backend_cluster
  task_definition = aws_ecs_task_definition.ecs_backend_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  dynamic "load_balancer" {
    for_each = var.aws_lb_target_group_arn != "" ? [var.aws_lb_target_group_arn] : []
    content {
      target_group_arn = var.aws_lb_target_group_arn
      container_name   = var.container_name
      container_port   = var.container_port
    }
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }
  network_configuration {
    # assign_public_ip = true
    security_groups = var.security_group_ids
    subnets         = var.subnet_ids
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}

resource "aws_appautoscaling_target" "scaling_target" {
  max_capacity       = var.max_capacity
  min_capacity       = 1
  resource_id        = "service/${var.ecs_backend_cluster_name}/${aws_ecs_service.ecs_backend_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}


resource "aws_appautoscaling_policy" "scaling_memory" {
  name               = "${aws_ecs_service.ecs_backend_service.name}-memory"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.scaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.scaling_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value       = var.target_value_memory_scaling
    scale_out_cooldown = var.scale_out_cooldown_memory
    scale_in_cooldown  = var.scale_in_cooldown_memory
  }
}

resource "aws_appautoscaling_policy" "scaling_cpu" {
  name               = "${aws_ecs_service.ecs_backend_service.name}-cpu"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.scaling_target.resource_id
  scalable_dimension = aws_appautoscaling_target.scaling_target.scalable_dimension
  service_namespace  = aws_appautoscaling_target.scaling_target.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value       = var.target_value_cpu_scaling
    scale_out_cooldown = var.scale_out_cooldown_cpu
    scale_in_cooldown  = var.scale_in_cooldown_cpu
  }
}
