# modules/vpc/main.tf
resource "aws_vpc" "example" {
  cidr_block = var.vpc_cidr_block
}
data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_subnet" "example" {
  count                   = length(var.subnet_cidr_blocks)
  vpc_id                  = aws_vpc.example.id
  cidr_block              = var.subnet_cidr_blocks[count.index]
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
}