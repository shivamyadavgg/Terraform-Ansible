# main.tf
provider "aws" {
  region = "us-west-2"  # Change the region as needed
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = "10.0.0.0/16"
  subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
  map_public_ip_on_launch = true
}

module "alb" {
  source = "./modules/alb"
  alb_name = "example-alb"
  alb_internal = false
  alb_security_group_id = module.security_group.alb_sg_id
  alb_subnets = module.vpc.subnet_ids
  listener_port = 80
  vpc_id = module.vpc.vpc_id
  tg_name = "example-tg"
  tg_port = 80
  health_check_path = "/"
  health_check_interval = 30
  health_check_timeout = 5
  health_check_healthy_threshold = 3
  health_check_unhealthy_threshold = 3
  health_check_matcher = "200-299"
}

module "ec2" {
  source = "./modules/ec2"
  instance_count = 2
  ami_id = "ami-0c55b159cbfafe1f0"  # Change this to a valid AMI ID
  instance_type = "t2.micro"
  subnet_id = module.vpc.subnet_ids[0]
  instance_security_group_id = module.security_group.instance_sg_id
  instance_user_data = <<-EOF
                        #!/bin/bash
                        echo "Hello, World" > /var/www/html/index.html
                        nohup busybox httpd -f -p 80 &
                        EOF

  tg_arn = module.alb.alb_target_group_arn
  tg_port = 80
  instance_name = "Test"
}

module "security_group" {
  source = "./modules/security_group"
  alb_sg_name = "alb_sg"
  instance_sg_name = "instance_sg"
  vpc_id = module.vpc.vpc_id
  sg_from_port = 80
  sg_to_port = 80
  sg_protocol = "tcp"
  sg_cidr_blocks = ["0.0.0.0/0"]
  sg_egress_from_port = 0
  sg_egress_to_port = 0
  sg_egress_protocol = "-1"
  sg_egress_cidr_blocks = ["0.0.0.0/0"]
}
