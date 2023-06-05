/*
 * Copyright (c) 2023 Uptycs, Inc. All rights reserved
 */

terraform {
  required_version = ">= 0.12.31"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.50.0"
    }
  }
}
