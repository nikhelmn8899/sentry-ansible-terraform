# Deploy Self-Hosted Sentry on AWS VM

This repository contains scripts and configurations to deploy a self-hosted Sentry instance on an AWS EC2 VM.

## Prerequisites

- AWS account with appropriate IAM permissions.
- Terraform installed locally.
- Ansible installed locally.

Before you begin, ensure you have the following prerequisites:

- *AWS Account*: You need an AWS account with appropriate IAM permissions to create and manage EC2 instances.
- *Terraform*: Install Terraform locally. Terraform is used to automate the provisioning of infrastructure on AWS.
- *Ansible*: Install Ansible locally. Ansible will automate the installation and configuration of Sentry on the AWS EC2 instance.

## Deployment Steps

Follow these steps to deploy Sentry on your AWS VM:

### 1. Clone the Repository

Clone this repository to your local machine:
https://github.com/nikhelmn8899/sentry-ansible-terraform

### 2. Provision AWS VM with Terraform
```root@ip-172-31-41-179:/home/ubuntu/self-hosted/terraform-sentry-vm#```
Navigate to terraform-sentry-vm directory:
```Bash
cd terraform/aws
terraform init
terraform apply
```
### 3. Provision AWS VM with Ansible
```root@ip-172-31-41-179:/home/ubuntu/self-hosted/ansible-sentry# ls```
```install-sentry.yml  inventory  roles```
```Bash
root@ip-172-31-41-179:/home/ubuntu/self-hosted/ansible-sentry#
root@ip-172-31-41-179:/home/ubuntu/self-hosted/ansible-sentry# ansible-playbook -i inventory install-sentry.yml

PLAY [sentry] ********************************************************************************************************************************

TASK [Gathering Facts] ***********************************************************************************************************************
ok: [172.31.43.34]

TASK [Install Docker] ************************************************************************************************************************
ok: [172.31.43.34]

TASK [Install Docker Compose] ****************************************************************************************************************
ok: [172.31.43.34]

TASK [Clone Self-Hosted Sentry] **************************************************************************************************************
ok: [172.31.43.34]

TASK [Install expect] ************************************************************************************************************************
ok: [172.31.43.34]

TASK [Run Sentry Installer with expect] ******************************************************************************************************
ASYNC POLL on 172.31.43.34: jid=j585171370758.7125 started=1 finished=0
ASYNC POLL on 172.31.43.34: jid=j585171370758.7125 started=1 finished=0
```









