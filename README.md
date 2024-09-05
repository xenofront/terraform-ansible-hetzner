# Infrastructure Provisioning with Terraform & Ansible

This repository allows you to automatically provision and configure a server on Hetzner, complete with firewall rules and additional configurations using Terraform and Ansible.

## Prerequisites

Ensure the following are installed on your local machine:
- [Docker](https://docs.docker.com/get-docker/)
- [Terraform](https://www.terraform.io/downloads.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Setup

### Step 1: Configure Terraform Variables

1. Navigate to the terraform directory and copy the example variables file:
    ```bash
    cp terraform/terraform.auto.tfvars.example terraform/terraform.auto.tfvars
    ```
2. Open the `terraform.auto.tfvars` file and input the required information such as hcloud_token, SSH keys, etc.

### Step 2: Add SSH Keys

In the `ssh-keys` directory, place your private and public SSH keys that will be used to access the remote server:
- `id_rsa`: Private key
- `id_rsa.pub`: Public key

These keys will be used to configure SSH access to the provisioned server.

## Provisioning the Server with Terraform

To spin up a server on Hetzner, follow these steps:

1. Build the Docker container:
    ```bash
    docker build -t terraform-ansible .
    ```

2. Run the Docker container:
    ```bash
    docker run -d --name terraform-ansible-container terraform-ansible
    ```

3. Access the container:
    ```bash
    docker exec -it terraform-ansible-container /bin/bash
    ```

4. Run the Terraform apply command:
    - You can use an alias to apply Terraform from anywhere:
    ```bash
    apply
    ```
    This command is equivalent to:
    ```bash
    cd /app/terraform && terraform apply --auto-approve
    ```

## Applying Configuration with Ansible

After the server is provisioned, you can use Ansible to configure additional settings as defined in the roles under the `ansible/roles` directory.

1. Change directory to ansible:
    ```bash
    cd /app/ansible
    ```

2. Run the Ansible playbook:
    ```bash
    ansible-playbook play.yml
    ```
    This will apply the configuration defined in the Ansible roles to the server.

## Conclusion

By following these steps, you'll provision a server on Hetzner and automatically configure it with firewall rules and other settings using Terraform and Ansible.
