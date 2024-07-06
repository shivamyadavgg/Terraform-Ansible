output "instance_id" {
  description = "ID of the newly created instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Publicly accessible IP address"
  value       = aws_instance.web.public_ip
}
