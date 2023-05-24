module "ecr-config" {
  source            = "uptycslabs/ecr-config/aws"
  uptycs_account_id = "cloudquery"

  # Copy the AWS Account ID from Uptycs UI
  # Uptycs' UI : "Cloud"->"AWS"->"Integrations"->"ACCOUNT INTEGRATION"
  external_id   = "Uptycs-AWS-ACCOUNT-ID"
}

output "aws_ecr_role_arn" {
  value = module.ecr-config.role_arn
}