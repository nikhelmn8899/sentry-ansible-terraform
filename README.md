# Self-Hosted Sentry Deployment

## Terraform Configuration
1. Navigate to the `sentry-terraform` directory.
2. Run `terraform init` to initialize Terraform.
3. Run `terraform apply` to deploy the VM.

## Ansible Playbook

1. Navigate to the `sentry-ansible` directory.
2. Edit the `hosts.ini` file and add your EC2 instance's public IP address.
3. Run `ansible-playbook -i hosts.ini install_sentry.yml --private-key=path/to/your/private/key.pem` to install and start Sentry.

