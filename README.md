# terraform-ecr-config

This module creates the necessary AWS IAM policy to allow read only ECR access for registry monitoring. It will return the IAM role ARN which has to be manually entered into the Uptycs console as part of the service integration process.

The following policies will be attached to this IAM role:

- AWS managed: arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly

<br/>

## Prerequisites

- Minimum required version of Terraform -> v0.12.31
- The user must have `Git` installed on the system that they are using to execute the Terraform script.
  - Instructions on how to install Git here: https://github.com/git-guides/install-git
- The IAM user or IAM role you use to execute the Terraform script should have the policy  `arn:aws:iam::aws:policy/AdministratorAccess` attached.

<br/>

## Running the Terraform Module

- Create a file with name as `main.tf` and paste the code given below into it.

```hcl
module "ecr-config" {
  source          = "uptycslabs/ecr-config/aws"
  uptycs_account_id = "cloudquery"

  # Copy the AWS Account ID from Uptycs UI
  # Uptycs' UI : "Cloud"->"AWS"->"Integrations"->"ACCOUNT INTEGRATION"
  external_id = "Uptycs-AWS-ACCOUNT-ID"

  tags = {
    Integration     = "uptycs"
  }
}

output "aws_ecr_role_arn" {
  value = module.ecr-config.role_arn
}
```
- Modify the ‘Input’ details as needed
- Uptycs Account ID and External ID must be copied from the Uptycs UI.

<br/>

![](assets/uptycs-web.png)

<br/>

## Inputs

| Name              | Description                                                           | Type     | Required |
| ----------------- | --------------------------------------------------------------------- | -------- | -------- |
| uptycs_account_id | Aws account id of Uptycs                                              | `string` | Yes      |
| external_id       | Role external ID provided by Uptycs. Copy the UUID ID from Uptycs' UI | `string` | Yes      |

<br/>

## Outputs

| Name             | Description      |
| ---------------- | ---------------- |
| aws_ecr_role_arn | AWS IAM role ARN |

<br/>

# Set Region and profile before execute terraform

```sh
export AWS_PROFILE="< profile name >"
export AWS_DEFAULT_REGION="<region-code>"
```
<br/>

# Execute Terraform script to get the role ARN

```sh
$ terraform init -upgrade
$ terraform plan
$ terraform apply
```
