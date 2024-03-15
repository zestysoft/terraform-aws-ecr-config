/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

variable "uptycs_account_id" {
  description = "Aws account id of Uptycs"
  type        = string
  # default = "${UPTYCS_AWS_KSPM_ACCOUNT_ID}"
}

variable "external_id" {
  description = "ExternalId to be used for API authentication."
  type        = string
  # default = "${EXTERNAL_ID}"
}

variable "tags" {
  description = "Tags to apply to the resources created by this module"
  type        = map(string)
  default     = {}
}
