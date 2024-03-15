/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

data "aws_iam_policy_document" "role_uptycs_trust" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.uptycs_account_id]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.external_id]
    }
  }
}

resource "aws_iam_role" "uptycs_integration_role" {
  assume_role_policy = data.aws_iam_policy_document.role_uptycs_trust.json

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]

  tags = var.tags
}
