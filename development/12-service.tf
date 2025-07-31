resource "aws_ecs_service" "ecs_service" {
  name            = "${var.environment}-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.service_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = aws_ecs_task_definition.service_task.family
    container_port   = var.miziworld_http_port
  }

  network_configuration {
    subnets = [
      "${aws_default_subnet.subnet_public_1a.id}",
    "${aws_default_subnet.subnet_public_1b.id}"]
    assign_public_ip = true
    security_groups = [
      aws_security_group.vpc_sg.id
    ]
  }
}
