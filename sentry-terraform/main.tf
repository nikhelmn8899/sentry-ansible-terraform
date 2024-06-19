provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "sentry_vm" {
  ami           = "ami-0167b3c8929118d4d" # Amazon Linux 2 AMI
  instance_type = "t2.medium"

  tags = {
    Name = "Sentry-VM"
  }

  key_name      = "mumbai"
}

output "instance_ip" {
  value = aws_instance.sentry_vm.public_ip
}
