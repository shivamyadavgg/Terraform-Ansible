# modules/security_group/variables.tf
variable "alb_sg_name" {
  description = "Name of the security group for the ALB"
}

variable "instance_sg_name" {
  description = "Name of the security group for the EC2 instances"
}

variable "vpc_id" {
  description = "ID of the VPC"
}

variable "sg_from_port" {
  description = "Start of port range for the ingress rule"
}

variable "sg_to_port" {
  description = "End of port range for the ingress rule"
}

variable "sg_protocol" {
  description = "IP protocol for the ingress rule"
}

variable "sg_cidr_blocks" {
  description = "CIDR block for the ingress rule"
  type        = list(string)
}

variable "sg_egress_from_port" {
  description = "Start of port range for the egress rule"
}

variable "sg_egress_to_port" {
  description = "End of port range for the egress rule"
}

variable "sg_egress_protocol" {
  description = "IP protocol for the egress rule"
}

variable "sg_egress_cidr_blocks" {
  description = "CIDR block for the egress rule"
  type        = list(string)
}

