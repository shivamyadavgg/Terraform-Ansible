# modules/alb/variables.tf
variable "alb_name" {
  description = "Name for the Application Load Balancer"
}

variable "alb_internal" {
  description = "Boolean indicating if the ALB should be internal"
  default     = false
}

variable "alb_security_group_id" {
  description = "ID of the security group for the ALB"
}

variable "alb_subnets" {
  description = "List of subnets IDs for the ALB"
  type        = list(string)
}

variable "listener_port" {
  description = "Port for the ALB listener"
  default     = 80
}

variable "tg_name" {
  description = "Name for the target group"
}

variable "tg_port" {
  description = "Port for the target group"
}

variable "health_check_path" {
  description = "Path for the health check"
}

variable "health_check_interval" {
  description = "Interval for the health check"
}

variable "health_check_timeout" {
  description = "Timeout for the health check"
}

variable "health_check_healthy_threshold" {
  description = "Healthy threshold for the health check"
}

variable "health_check_unhealthy_threshold" {
  description = "Unhealthy threshold for the health check"
}

variable "health_check_matcher" {
  description = "HTTP codes for a successful health check"
  default     = "200-299"
}
variable "vpc_id" {
}
