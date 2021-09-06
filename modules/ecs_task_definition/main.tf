locals {
  family   = aws_ecs_task_definition.main.family
  revision = max(aws_ecs_task_definition.main.revision, data.aws_ecs_task_definition.latest.revision)
}

resource "aws_ecs_task_definition" "main" {
  family                   = "${var.name}-task-${var.environment}"
  container_definitions    = var.container_definitions
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
}

data "aws_ecs_task_definition" "latest" {
  task_definition = aws_ecs_task_definition.main.family
}
