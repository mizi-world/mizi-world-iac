resource "aws_ecs_task_definition" "service_task" {
  family                   = "${var.environment}-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = var.ecs_memory_size
  cpu                      = var.ecs_cpu_size
  execution_role_arn       = aws_iam_role.task_role.arn
  container_definitions = jsonencode(
    [
      {
        "name" : "${var.environment}-task"
        "image" : "${aws_ecr_repository.ecr_image.repository_url}:latest",
        "essential" : true,
        "portMappings" : [
          {
            "containerPort" : "${var.miziworld_http_port}",
            "hostPort" : "${var.miziworld_http_port}"
          }
        ],
        "logConfiguration" : {
          "logDriver" : "awslogs",
          "options" : {
            "awslogs-group" : "${aws_cloudwatch_log_group.cw_log.name}",
            "awslogs-region" : "${var.aws_region}",
            "awslogs-stream-prefix" : "ecs"
          }
        },
        "memory" : "${var.ecs_memory_size}"
        "cpu" : "${var.ecs_cpu_size}"
      }
  ])
}
