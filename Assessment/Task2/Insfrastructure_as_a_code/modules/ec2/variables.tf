# modules/ec2/variables.tf
variable "instance_count" {
  description = "Number of EC2 instances to create"
}
variable "instance_name" {
  description = "Base name or prefix for EC2 instance names"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
}

variable "subnet_id" {
  description = "ID of the subnet for the EC2 instances"
}

variable "instance_security_group_id" {
  description = "ID of the security group for the EC2 instances"
}

variable "instance_user_data" {
  description = "User data for the EC2 instances"
}

variable "tg_arn" {
  description = "ARN of the target group to attach instances"
}

variable "tg_port" {
  description = "Port for the target group"
}
