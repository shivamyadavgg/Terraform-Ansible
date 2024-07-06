module "ec2_instance" {
  source        = "./modules/ec2"
  region        = var.region
  key_name      = var.key_name
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_id        = var.vpc_id
}
