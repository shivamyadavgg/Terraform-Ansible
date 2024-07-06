output "ec2_instance_id" {
  description = "ID of the newly created instance"
  value       = module.ec2_instance.instance_id
}

output "ec2_public_ip" {
  description = "Publicly accessible IP address"
  value       = module.ec2_instance.public_ip
}
