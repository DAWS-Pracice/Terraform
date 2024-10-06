output "public_ip" {
  value       = aws_instance.terraform.public_ip
  description = "This is public ip of instance created"
  sensitive   = false
}
