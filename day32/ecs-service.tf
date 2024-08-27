resource "aws_ecs_service" "frontend" {
  name            = "frontend-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.frontend.arn
  desired_count   = 1
  launch_type = "FARGATE"
  network_configuration {
    subnets          = [aws_subnet.public.id]
    assign_public_ip = true
    security_groups  = [aws_security_group.frontend_sg.id]
  }
}

resource "aws_ecs_service" "backend" {
  name            = "backend-service"
  launch_type = "FARGATE"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.backend.arn
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.private1.id]
    security_groups = [aws_security_group.backend_sg.id]
  }
}
