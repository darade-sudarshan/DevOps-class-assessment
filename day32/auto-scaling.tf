resource "aws_appautoscaling_target" "frontend" {
  max_capacity = 3
  min_capacity = 1
  resource_id  = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.frontend.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace = "ecs"
}

resource "aws_appautoscaling_policy" "frontend_scale_out" {
  name                   = "frontend-scale-out"
  policy_type            = "StepScaling"
  resource_id = aws_appautoscaling_target.frontend.resource_id
  scalable_dimension = aws_appautoscaling_target.frontend.scalable_dimension
  service_namespace = aws_appautoscaling_target.frontend.service_namespace
  step_scaling_policy_configuration {
    adjustment_type = "ChangeInCapacity"
    cooldown = 60
    metric_aggregation_type = "Maximum"
    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment = -1
    }
  }  
    
}
