output "instance_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.sentry.public_ip
}

output "private_key_pem" {
  description = "The private key in PEM format"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

