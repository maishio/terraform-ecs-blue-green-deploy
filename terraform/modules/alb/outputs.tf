output "alb_arn_suffix" {
  description = "ARN suffix of the ALB"
  value       = module.alb.elb.arn_suffix
}

output "blue_target_group_arn" {
  description = "ARN of the blue target group"
  value       = module.blue_target_group.elb_target_group.arn
}

output "blue_target_group_arn_suffix" {
  description = "ARN suffix of the blue target group"
  value       = module.blue_target_group.elb_target_group.arn_suffix
}

output "blue_target_group_name" {
  description = "Name of the blue target group"
  value       = module.blue_target_group.elb_target_group.name
}

output "green_target_group_arn" {
  description = "ARN of the green target group"
  value       = module.green_target_group.elb_target_group.arn
}

output "green_target_group_name" {
  description = "Name of the green target group"
  value       = module.green_target_group.elb_target_group.name
}

output "production_listener_arn" {
  description = "ARN of the production listener"
  value       = module.production_listener.elb_listener.arn
}

output "test_listener_arn" {
  description = "ARN of the test listener"
  value       = module.test_listener.elb_listener.arn
}
