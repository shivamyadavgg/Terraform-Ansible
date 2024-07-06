variable "region" {
  description = "AWS region where the instance will be deployed"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key to be installed on the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type "
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet_ID where we have to deployed the instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC _ID where we have to deploy the instance"
  type        = string
}
