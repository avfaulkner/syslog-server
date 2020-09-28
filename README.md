# Quick syslog Server

This stack builds a single syslog server and basic networking infrastructure.

### Use case
- Running tests using a syslog server using basic infra

## Requirements

### Tooling

- Terraform >= 0.12.28
- AWS Provider >= 2.0

## Usage
- Add your desired variables to aws/terraform.tfvars file

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
