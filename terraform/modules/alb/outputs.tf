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

output "blue_listener_arn" {
  description = "ARN of the blue listener"
  value       = module.blue_listener.elb_listener.arn
}

output "green_listener_arn" {
  description = "ARN of the green listener"
  value       = module.green_listener.elb_listener.arn
}
