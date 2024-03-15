/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

output "role_arn" {
  description = "ARN of the created role, please update this back on Uptycs' UI"
  value       = aws_iam_role.uptycs_integration_role.arn
}

output "external_id" {
  description = "ExternalId associated with the role, please update this back on Uptycs' UI"
  value       = var.external_id
}