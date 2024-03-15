module "ecr-config" {
  source            = "uptycslabs/ecr-config/aws"
  uptycs_account_id = "cloudquery"

  # Copy the AWS Account ID from Uptycs UI
  # Uptycs' UI : "Configurations"->"Registry Configuration"->"ADD REGISTRY"
  external_id   = "Uptycs-AWS-ACCOUNT-ID"

  tags = {
    Integration     = "uptycs"
  }
}

output "aws_ecr_role_arn" {
  value = module.ecr-config.role_arn
}
