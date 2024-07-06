# modules/alb/outputs.tf
output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.example.dns_name
}
output "alb_target_group_arn" {
  value = aws_lb_target_group.example.arn
}
