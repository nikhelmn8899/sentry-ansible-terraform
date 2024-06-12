resource "aws_key_pair" "sentry_key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_instance" "sentry" {
  ami                    = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (change as needed)
  instance_type          = var.instance_type
  key_name               = aws_key_pair.sentry_key_pair.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "SentryServer"
  }
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "sentry-ssh-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.sentry.public_ip
}

output "private_key_pem" {
  description = "The private key in PEM format"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}
