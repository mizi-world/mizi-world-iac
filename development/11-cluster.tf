resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.environment}-cluster"

  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }

  setting {
    name  = "containerInsights"
    value = "disabled"
  }
}
