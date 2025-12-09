
output "public_ip" {
  value       = aws_instance.app.public_ip
  description = "Public IP of the EC2 instance"
}

output "public_dns" {
  value       = aws_instance.app.public_dns
  description = "Public DNS of the EC2 instance"
}

output "app_url" {
  value       = "http://${aws_instance.app.public_dns}"
  description = "URL to access the application"
}
