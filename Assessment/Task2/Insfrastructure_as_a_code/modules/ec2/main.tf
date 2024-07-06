# modules/ec2/main.tf
resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.instance_security_group_id]

  tags = {
    Name = "${var.instance_name}-${count.index}"
  }

  user_data = var.instance_user_data
}

resource "aws_lb_target_group_attachment" "example" {
  count            = var.instance_count
  target_group_arn = var.tg_arn
  target_id        = aws_instance.example.*.id[count.index]
  port             = var.tg_port
}
