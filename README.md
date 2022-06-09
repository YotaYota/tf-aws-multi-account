# AWS Multi Account with Terraform

The architecture of this multi-account setup is as follows:
- Create IAM Groups in main account
- Create IAM Roles in sub-accounts giving permissions to those groups

## Prerequisites

AWS Organizations accounts:

- Management account (corresponds to main directory)
- Sub-accounts (corresponds to environments directory)

The account numbers referenced in variable `aws_account_ids`.

IAM Roles:

- IAM Role in each sub-account assumed by terraform to create resources.

**Note**: Inside `env_vars/<ENV>.tfvars` account numbers are listed. They need
to be changed to accounts corresponding to your organizations.

## Structure

```
main/
  env_vars/
    main.tfvars
environments/
  env_vars/
    <ENV>.tfvars
```

Main contains resources that belongs to the root account, eg

- IAM Users
- IAM Groups
- IAM Policies

Environments contains resources created per environment.

## Usage

Using *Terraform Workspaces* to represent environments.

- In *main/*, the only workspace is **main**.
- In *environments/* one workspace is created per deploy environment.

To **apply** for one environment

```
ENV=<ENV> make plan
ENV=<ENV> make apply
```

Above `make` commands is shorthand for

```
$ terraform workspace select <ENV>
$ terraform apply -var-file="env_vars/<ENV>.tfvars"
```

**Note**: main needs to applied before environments.

## Credits

[Hashicorp demo "Going Multi-Account With Terraform on AWS"](https://www.hashicorp.com/resources/going-multi-account-with-terraform-on-aws)
