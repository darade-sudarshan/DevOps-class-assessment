resource "aws_ecs_cluster" "main" {
  name = "sudarshan-ecs-cluster"
}

resource "aws_ecs_task_definition" "frontend" {
  family                = "frontend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode          = "awsvpc"
  cpu                   = "256"
  memory                = "512"

  container_definitions = jsonencode([
    {
      name      = "frontend"
      image     = "daradesudarshan/centralrepo:nginx-frontend-flask-v1"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
}

resource "aws_ecs_task_definition" "backend" {
  family                = "backend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode          = "awsvpc"
  cpu                   = "256"
  memory                = "512"

  container_definitions = jsonencode([
    {
      name      = "backend"
      image     = "daradesudarshan/centralrepo:flask-backend-mysql-v1"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ]
    }
  ])

  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
}
