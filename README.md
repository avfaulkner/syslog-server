# Quick Syslog Server

This stack builds a single syslog server and basic networking infrastructure.

### Use case
- Running tests requiring a syslog server

## Requirements

### Tooling

- Terraform >= 0.12.28
- AWS Provider >= 2.0

## Usage
Add your desired variables to aws/terraform.tfvars file
- Instance key variable: 
    - public_key: Add public key material (string starting with ssh-rsa...)
- Instance AMI variables: 
    - ami: The AMI ID of the desired instance 
    - marketplace_ami_name: The name of an image in the AWS Marketplace.
    Examples could be "ubuntu*", "centos*", etc. 
    - Priority is given to the "ami" variable; if a specific AMI ID is provided, 
    we will use that image. 
    

Initialize the environment

```
terraform init
```

Planning

```
terraform plan 
```

Apply

```
terraform apply 
```

Destroy

```
terraform destroy
```

### Note
To view a list of resources that have been created

```
terraform state list
```