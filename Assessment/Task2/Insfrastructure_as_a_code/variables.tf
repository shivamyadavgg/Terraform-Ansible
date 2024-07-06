variable "subnet_cidr_blocks" {
  type    = list(string)
  # Optionally provide a default value if appropriate
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_cidr_block" {
  type    = string
  # Optionally provide a default value if appropriate
  default = "10.0.0.0/16"
}