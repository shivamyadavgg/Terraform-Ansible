# modules/security_group/outputs.tf
output "alb_sg_id" {
  description = "ID of the security group for the ALB"
  value       = aws_security_group.alb_sg.id
}

output "instance_sg_id" {
  description = "ID of the security group for the EC2 instances"
  value       = aws_security_group.instance_sg.id
}
